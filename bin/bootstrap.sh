#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DEFAULT_FILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../files && pwd)

# Read in a path from first command line argument
FILES_DIR=${1:-$DEFAULT_FILES_DIR}

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# shellcheck source=bin/run_hook.sh
source "${DIR}"/run_hook.sh
# shellcheck source=bin/link_file.sh
source "${DIR}"/link_file.sh

FILES=$(run_hook "${FILES_DIR}" _homestarlinker_manifest.sh)

echo "Attempting to run pre hook."
run_hook "${FILES_DIR}" "_homestarlinker_bootstrap_pre.sh"

echo "Linking files."
for FILE in ${FILES}; do
 link_file "${HOME}" "${FILES_DIR}" "${FILE}"
done

echo "Attempting to run post hook."
run_hook "${FILES_DIR}" "_homestarlinker_bootstrap_post.sh"
