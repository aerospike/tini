#!/bin/bash
set -o errexit
set -o nounset

IMG="tini"

if [[ "$#" != 1 ]]; then
  echo "Usage: $0 ARCH_SUFFIX"
  exit 1
fi
suffix="$1"

IMG="tini-build_${suffix}"

PYTHON=python3.9

if ! type "$PYTHON" > /dev/null; then
	PYTHON=python
fi

$PYTHON test/run_outer_tests.py "${IMG}"
