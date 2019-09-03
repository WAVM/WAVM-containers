FROM ubuntu:18.04

RUN apt-get update &&\
	apt-get install -y curl software-properties-common &&\
	curl -L https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - &&\
	add-apt-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main" &&\
	apt-get update &&\
	apt-get install -y clang-format-9 git &&\
	apt-get clean

CMD /bin/bash
