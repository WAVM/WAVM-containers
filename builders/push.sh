#!/bin/bash

set -e

docker push wavm/ubuntu19.10-builder
docker push wavm/ubuntu16.04-builder
docker push wavm/centos7.0-builder

docker push wavm/clang-format-check