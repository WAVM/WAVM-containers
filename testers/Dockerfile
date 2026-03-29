ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# Detect package manager and install Python 3
# Tester containers only need Python 3 to run test.py and basic tools

ARG BASE_IMAGE
RUN case "${BASE_IMAGE}" in \
        ubuntu:*|debian:*) \
            apt-get update && \
            apt-get install -y python3 cmake ninja-build gcc g++ && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* \
            ;; \
        fedora:*) \
            dnf install -y python3 cmake ninja-build gcc gcc-c++ && \
            dnf clean all \
            ;; \
        almalinux:*) \
            dnf install -y python3 python3-pip cmake gcc gcc-c++ && \
            pip3 install ninja && \
            dnf clean all \
            ;; \
        opensuse/leap:*) \
            zypper install -y python3 tar cmake ninja gcc gcc-c++ && \
            zypper clean --all \
            ;; \
        archlinux:*) \
            pacman -Syu --noconfirm python cmake ninja gcc && \
            pacman -Scc --noconfirm \
            ;; \
        *) \
            echo "Unknown base image: ${BASE_IMAGE}" && exit 1 \
            ;; \
    esac

CMD ["/bin/bash"]
