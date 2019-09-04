#!/bin/bash

set -e

# Ubuntu
docker push wavm/package-tester-deb:ubuntu16.04
docker push wavm/package-tester-deb:ubuntu18.04
docker push wavm/package-tester-deb:ubuntu19.04

# Debian
docker push wavm/package-tester-deb:debian8
docker push wavm/package-tester-deb:debian9
docker push wavm/package-tester-deb:debian10

# CentOS
docker push wavm/package-tester-rpm:centos7
docker push wavm/package-tester-rpm:centos7.0

# Fedora
docker push wavm/package-tester-rpm:fedora29
docker push wavm/package-tester-rpm:fedora30
docker push wavm/package-tester-rpm:fedora31

# openSUSE
docker push wavm/package-tester-rpm:opensuseleap15.0
docker push wavm/package-tester-rpm:opensuseleap15.1

# ArchLinux
docker push wavm/package-tester-pacman:archlinux
