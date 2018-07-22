#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DEFAULT_FILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../files && pwd)

# Read in a path from first argument
FILES_DIR=${1:-$DEFAULT_FILES_DIR}

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# shellcheck source=bin/run_hook.sh
source "${DIR}"/run_hook.sh
# shellcheck source=bin/link_file.sh
source "${DIR}"/unlink_file.sh

FILES=$(run_hook "${FILES_DIR}" manifest.sh)

echo "Attempting to run pre-clean hook"
run_hook "${FILES_DIR}" clean_pre.sh

echo "Cleaning up links"
for FILE in ${FILES}; do
 unlink_file "${HOME}" "${FILES_DIR}" "${FILE}"
done

echo "Attempting to run post clean hook"
run_hook "${FILES_DIR}" clean_post.sh
