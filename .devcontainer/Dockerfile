FROM ubuntu:24.04

# Install tools
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    doxygen \
    graphviz \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (named 'dev')
ARG USERNAME=dev
ARG USER_UID=2000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
 && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
 && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
 && chmod 0440 /etc/sudoers.d/$USERNAME

# Set working directory
WORKDIR /workspace

# Switch to non-root user
USER $USERNAME