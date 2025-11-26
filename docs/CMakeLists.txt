find_package(Doxygen REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(DoxygenUtilities)

# ------------------------
# Doxygen targets
# ------------------------
# Example usage of your add_doxygen_target function
# Assume you already have it in top-level CMake or you can define it here
add_doxygen_target(
    mylib
    "MyLib"
    "${CMAKE_SOURCE_DIR}/mylib/include"
    "${CMAKE_BINARY_DIR}/docs/mylib"
    # TAGFILE_OUT "${CMAKE_BINARY_DIR}/docs/mylib/mylib.tag"
)

add_doxygen_target(
    mysuite
    "MySuite"
    "${CMAKE_SOURCE_DIR}/mysuite/include"
    "${CMAKE_BINARY_DIR}/docs/mysuite"
    # TAGFILE_DEPS "${CMAKE_BINARY_DIR}/docs/mylib/mylib.tag"
)

# ------------------------
# Copy CSS for landing page
# ------------------------
add_custom_command(
    OUTPUT ${CMAKE_BINARY_DIR}/docs/style.css
    COMMAND ${CMAKE_COMMAND} -E copy
            ${CMAKE_CURRENT_SOURCE_DIR}/style.css
            ${CMAKE_BINARY_DIR}/docs/style.css
)
add_custom_target(copy_docs_assets ALL
    DEPENDS ${CMAKE_BINARY_DIR}/docs/style.css
)

# ------------------------
# Bridge page
# ------------------------
# Variables for template
set(PROJECT_NAME "MyProject")
set(PROJECT_DESC "High-performance robotics and embedded controls libraries.")
set(GITHUB_REPO_URL "https://github.com/yourname/yourrepo")

# Instead of a list, just define each module HTML entry
# Bridge page HTML content
set(DOC_MODULES "")
set(DOC_MODULES "${DOC_MODULES}<div class=\"card\"><a href=\"mylib/html/index.html\">Core Library (MyLib)</a></div>")
set(DOC_MODULES "${DOC_MODULES}<div class=\"card\"><a href=\"mysuite/html/index.html\">Addon Suite (MySuite)</a></div>")

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/index.html.in
    ${CMAKE_BINARY_DIR}/docs/index.html
    @ONLY
)

# Optional: make bridge page depend on doc generation
add_custom_target(docs ALL
    DEPENDS copy_docs_assets mylib_doc mysuite_doc
    COMMENT "Generating documentation landing page"
)