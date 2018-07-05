#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# shellcheck source=bin/unlink_file.sh
source "${DIR}"/unlink_file.sh
# shellcheck source=tasks.sh
source "${DIR}"/../tasks.sh
