#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# shellcheck source=bin/run_hook.sh
source "${DIR}"/run_hook.sh
# shellcheck source=bin/link_file.sh
source "${DIR}"/link_file.sh

FILES=$(run_hook manifest.sh)

echo "Running pre hook."
run_hook "pre.sh"

echo "Linking files"
for FILE in $FILES; do
 link_file $FILE
done

echo "Running post hook."
run_hook "post.sh"
