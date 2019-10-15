#!/bin/bash

set -e

# Ubuntu
docker build -t wavm/package-tester-deb:ubuntu16.04 --build-arg BASE_IMAGE=ubuntu:16.04 package-tester-deb
docker build -t wavm/package-tester-deb:ubuntu18.04 --build-arg BASE_IMAGE=ubuntu:18.04 package-tester-deb
docker build -t wavm/package-tester-deb:ubuntu19.04 --build-arg BASE_IMAGE=ubuntu:19.04 package-tester-deb

# Debian
docker build -t wavm/package-tester-deb:debian8  --build-arg BASE_IMAGE=debian:8  package-tester-deb
docker build -t wavm/package-tester-deb:debian9  --build-arg BASE_IMAGE=debian:9  package-tester-deb
docker build -t wavm/package-tester-deb:debian10 --build-arg BASE_IMAGE=debian:10 package-tester-deb

# CentOS
docker build -t wavm/package-tester-rpm:centos7   --build-arg BASE_IMAGE=centos:7        package-tester-rpm/yum
docker build -t wavm/package-tester-rpm:centos7.0 --build-arg BASE_IMAGE=centos:7.0.1406 package-tester-rpm/yum
docker build -t wavm/package-tester-rpm:centos8   --build-arg BASE_IMAGE=centos:8        package-tester-rpm/yum

# Fedora
docker build -t wavm/package-tester-rpm:fedora29 --build-arg BASE_IMAGE=fedora:29 package-tester-rpm/yum
docker build -t wavm/package-tester-rpm:fedora30 --build-arg BASE_IMAGE=fedora:30 package-tester-rpm/yum
docker build -t wavm/package-tester-rpm:fedora31 --build-arg BASE_IMAGE=fedora:31 package-tester-rpm/yum

# openSUSE
docker build -t wavm/package-tester-rpm:opensuseleap15.0 --build-arg BASE_IMAGE=opensuse/leap:15.0 package-tester-rpm/zypper
docker build -t wavm/package-tester-rpm:opensuseleap15.1 --build-arg BASE_IMAGE=opensuse/leap:15.1 package-tester-rpm/zypper

# ArchLinux
docker build -t wavm/package-tester-pacman:archlinux --build-arg BASE_IMAGE=archlinux/base:latest package-tester-pacman
