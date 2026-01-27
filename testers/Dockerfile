ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# Detect package manager and install Python 3
# Tester containers only need Python 3 to run test.py and basic tools

ARG BASE_IMAGE
RUN case "${BASE_IMAGE}" in \
        ubuntu:*|debian:*) \
            apt-get update && \
            apt-get install -y python3 && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* \
            ;; \
        fedora:*) \
            dnf install -y python3 && \
            dnf clean all \
            ;; \
        almalinux:*) \
            dnf install -y python3 && \
            dnf clean all \
            ;; \
        opensuse/leap:*) \
            zypper install -y python3 && \
            zypper clean --all \
            ;; \
        archlinux:*) \
            pacman -Syu --noconfirm python && \
            pacman -Scc --noconfirm \
            ;; \
        *) \
            echo "Unknown base image: ${BASE_IMAGE}" && exit 1 \
            ;; \
    esac

CMD ["/bin/bash"]
