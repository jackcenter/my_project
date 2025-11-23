#include "mylib/hello.hpp"

#include <fmt/format.h>

#include <config.h>

namespace mylib {
std::string hello() {
  const double value_1{Config::VALUE_1};
  return fmt::format(
      "Hello from mylib! I can read VALUE_1, {}, from the config!", value_1);
}
} // namespace mylib