#!/bin/bash

set -e

(cd builders && ./build.sh)
(cd testers && ./build.sh)