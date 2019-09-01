#!/bin/bash

set -e

docker build -t wavm/ubuntu16.04-builder builder/ubuntu16.04
docker build -t wavm/centos7.0-builder builder/centos7.0