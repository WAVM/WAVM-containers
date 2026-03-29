ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# Detect package manager and install Python 3
# Tester containers only need Python 3 to run test.py and basic tools

ARG BASE_IMAGE
RUN case "${BASE_IMAGE}" in \
        ubuntu:20.04) \
            apt-get update && \
            apt-get install -y python3.9 cmake ninja-build gcc g++ && \
            update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* \
            ;; \
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
            dnf install -y python39 && \
            alternatives --set python3 /usr/bin/python3.9 && \
            dnf clean all \
            ;; \
        opensuse/leap:*) \
            zypper install -y python3 gzip tar cmake ninja gcc gcc-c++ && \
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
