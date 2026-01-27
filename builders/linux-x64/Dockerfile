FROM quay.io/pypa/manylinux_2_28_x86_64

# Install LLVM toolset (clang, lld) for bootstrapping WAVM-LLVM LTO builds
# Also install build tools: cmake, git, python3, jq
RUN dnf install -y \
    clang \
    lld \
    cmake \
    git \
    python3 \
    jq \
    && dnf clean all

# Install ninja via pip (dnf version is too old for LLVM's multi-output rules)
RUN pip3 install ninja

CMD ["/bin/bash"]
