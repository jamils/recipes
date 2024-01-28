#!/bin/bash
set -e
set -o pipefail
readonly DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null 2>&1 && pwd )
for f in $(find "${DIR}" -not -path '*.github*' -not -path '*cook*' -not -path '*libbash*' -name \*.md); do
  docker run --rm -v /:/tmp:ro -i -w /tmp ghcr.io/tcort/markdown-link-check:stable "/tmp${f}" -c "/tmp${DIR}/mlc_config.json" # || exit 1
done
