#!/bin/bash

set -e

docker build -t wavm/ubuntu16.04-builder ubuntu16.04
docker build -t wavm/centos7.0-builder   centos7.0

docker build -t wavm/clang-format-check  clang-format-check