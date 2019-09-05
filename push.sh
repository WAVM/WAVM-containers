#!/bin/bash

set -e

(cd builders && ./push.sh)
(cd testers && ./push.sh)