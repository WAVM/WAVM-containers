# x86_64 sysroot for cross-compilation (glibc 2.28 compatible)
FROM quay.io/pypa/manylinux_2_28_x86_64 AS x86_64-sysroot

FROM quay.io/pypa/manylinux_2_28_aarch64

# Install LLVM toolset (clang, lld) for bootstrapping WAVM-LLVM LTO builds
# Also install build tools: cmake, git, jq
RUN dnf install -y \
    clang \
    lld \
    cmake \
    git \
    jq \
    gcc-toolset-14-gdb \
    gcc-toolset-14-libasan-devel \
    gcc-toolset-14-libubsan-devel \
    && dnf clean all

# Use manylinux's Python 3.9 instead of system Python 3.6
# Prepend gcc-toolset-14 so its GDB (14.x) shadows the system GDB (8.2)
ENV PATH="/opt/rh/gcc-toolset-14/root/usr/bin:/opt/python/cp39-cp39/bin:${PATH}"

# Install ninja via pip (dnf version is too old for LLVM's multi-output rules)
# Install uv for uvx (Python linting tools)
RUN pip3 install ninja uv

# Copy entire x86_64 root as sysroot for cross-compilation.
# Uses cp -a to preserve symlinks (e.g. /lib -> usr/lib) that COPY would follow.
RUN --mount=from=x86_64-sysroot,source=/,target=/x86_64-root \
    cp -a /x86_64-root /sysroot-x86_64

CMD ["/bin/bash"]
