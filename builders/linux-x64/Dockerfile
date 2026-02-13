# AArch64 sysroot for cross-compilation (glibc 2.28 compatible)
FROM quay.io/pypa/manylinux_2_28_aarch64 AS aarch64-sysroot

FROM quay.io/pypa/manylinux_2_28_x86_64

# Install LLVM toolset (clang, lld) for bootstrapping WAVM-LLVM LTO builds
# Also install build tools: cmake, git, jq
RUN dnf install -y \
    clang \
    lld \
    cmake \
    git \
    jq \
    && dnf clean all

# Use manylinux's Python 3.9 instead of system Python 3.6
ENV PATH="/opt/python/cp39-cp39/bin:${PATH}"

# Install ninja via pip (dnf version is too old for LLVM's multi-output rules)
RUN pip3 install ninja

# Copy entire aarch64 root as sysroot for cross-compilation.
# Uses cp -a to preserve symlinks (e.g. /lib -> usr/lib) that COPY would follow.
RUN --mount=from=aarch64-sysroot,source=/,target=/aarch64-root \
    cp -a /aarch64-root /sysroot-aarch64

CMD ["/bin/bash"]
