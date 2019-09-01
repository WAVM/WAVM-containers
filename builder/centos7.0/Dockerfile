FROM centos:centos7.0.1406 AS base

# Install packages
RUN yum install -y binutils emacs-filesystem gcc gcc-c++ git rpm-build tar vim-filesystem wget zip &&\
	yum clean all

# Download and install ninja-build RPM from the EPEL repo
RUN curl -o ninja-build.rpm http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/n/ninja-build-1.7.2-2.el7.x86_64.rpm &&\
	rpm -i ninja-build.rpm &&\
	rm -f ninja-build.rpm &&\
	ln -s /usr/bin/ninja-build /usr/bin/ninja

# Install CMake.
RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.tar.gz &&\
	cd /usr/local &&\
	tar -xzf /cmake-3.15.2-Linux-x86_64.tar.gz --strip 1 &&\
	rm -f /cmake-3.15.2-Linux-x86_64.tar.gz

FROM base AS llvm6

# Download and extract the LLVM 6 source. curl doesn't work due to a https bug in this release.
RUN wget https://github.com/llvm/llvm-project/archive/release/6.x.zip &&\
	unzip /6.x.zip &&\
	rm /6.x.zip &&\
	mv llvm-project-release-6.x llvm-project

# Configure the LLVM build
RUN mkdir /llvm-build && cd /llvm-build && cmake -G Ninja \
	-DLLVM_TARGETS_TO_BUILD=X86 \
	-DLLVM_ENABLE_PROJECTS='clang;compiler-rt;lld' \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/opt/llvm6 \
	/llvm-project/llvm

# Build LLVM
RUN ninja -C /llvm-build

# Install LLVM
RUN ninja -C /llvm-build install &&\
	rm -rf /llvm-build

# Add symbolic links to the LLVM binaries in /usr/local/bin
RUN ln -s /opt/llvm6/bin/* /usr/local/bin

FROM llvm6 AS llvm9

# Download and extract the LLVM source. curl doesn't work due to a https bug in this release.
RUN wget https://github.com/llvm/llvm-project/archive/release/9.x.zip &&\
	unzip /9.x.zip &&\
	rm /9.x.zip &&\
	mv llvm-project-release-9.x llvm-project

# Configure the LLVM build
RUN mkdir /llvm-build && cd /llvm-build && cmake -G Ninja \
	-DLLVM_TARGETS_TO_BUILD=X86 \
	-DLLVM_ENABLE_PROJECTS='clang;compiler-rt;lld' \
	-DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_RANLIB=/usr/local/bin/llvm-ranlib \
	-DCMAKE_AR=/usr/local/bin/llvm-ar \
	-DLLVM_USE_LINKER=lld \
	-DLLVM_ENABLE_LTO=thin \
    -DLLVM_INCLUDE_DOCS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_GO_TESTS=OFF \
    -DLLVM_INCLUDE_UTILS=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm9 \
	/llvm-project/llvm

# Build LLVM
RUN ninja -C /llvm-build

# Install LLVM
RUN ninja -C /llvm-build install

# Create an image that squashes the LLVM9 build by copying just the install on top of the base image.
FROM base as llvm9-squashed
COPY --from=llvm9 /opt/llvm9 /opt/llvm9

# Add symbolic links to the LLVM binaries in /usr/local/bin
RUN ln -s /opt/llvm9/bin/* /usr/local/bin
