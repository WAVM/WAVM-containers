FROM ubuntu:19.10

RUN apt-get update &&\
	apt-get install -y curl software-properties-common &&\
	apt-get update &&\
	apt-get install -y build-essential clang-9 gcc git g++ lld-9 ninja-build wget zip &&\
	apt-get clean

# Create symbolic links to the LLVM binaries in /usr/local/bin.
# These are necessary to add aliases of the tools without the "-9" suffix,
# and so they have the same absolute path as the CentOS image. This allows
# hard coding the path to e.g. llvm-ar and llvm-ranlib.
RUN ln -s /usr/lib/llvm-9/bin/* /usr/local/bin

# Install CMake.
RUN curl -L -o /cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.tar.gz &&\
	cd /usr/local &&\
	tar -xzf /cmake.tar.gz --strip 1 &&\
	rm -f /cmake.tar.gz

CMD /bin/bash
