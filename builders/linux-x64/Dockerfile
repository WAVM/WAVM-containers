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

# Copy aarch64 sysroot for cross-compilation
COPY --from=aarch64-sysroot /usr/include /sysroot-aarch64/usr/include
COPY --from=aarch64-sysroot /usr/lib64 /sysroot-aarch64/usr/lib64
COPY --from=aarch64-sysroot /lib64 /sysroot-aarch64/lib64

CMD ["/bin/bash"]
