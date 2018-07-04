#!/usr/bin/env bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# shellcheck source=bin/link_file.sh
source "${DIR}"/link_file.sh
# shellcheck source=tasks.sh
source "${DIR}"/../tasks.sh
