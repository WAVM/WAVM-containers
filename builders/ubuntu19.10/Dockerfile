FROM ubuntu:19.10

RUN apt-get update &&\
	apt-get install -y curl software-properties-common &&\
	apt-get update &&\
	apt-get install -y build-essential clang gcc git g++ lld ninja-build wget zip &&\
	apt-get clean

# Install CMake.
RUN curl -L -o /cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.tar.gz &&\
	cd /usr/local &&\
	tar -xzf /cmake.tar.gz --strip 1 &&\
	rm -f /cmake.tar.gz

CMD /bin/bash
