FROM quay.io/pypa/manylinux_2_28_x86_64

# Install LLVM toolset (clang, lld) for bootstrapping WAVM-LLVM LTO builds
# Also install build tools: cmake, ninja, git
RUN dnf install -y \
    clang \
    lld \
    cmake \
    ninja-build \
    git \
    python3 \
    jq \
    && dnf clean all

CMD ["/bin/bash"]
