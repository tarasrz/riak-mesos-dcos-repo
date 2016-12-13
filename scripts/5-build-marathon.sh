#!/bin/bash
set -o errexit -o nounset -o pipefail

SCRIPTS_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
UNIVERSE_DIR="${SCRIPTS_DIR}/.."
PACKAGES_DIR="${UNIVERSE_DIR}/repo/packages"
RESOURCE_NAME="resource.json"
MARATHON_TPL_NAME="marathon.json.mustache.tpl"
MARATHON_NAME="marathon.json.mustache"
PACKAGE_DIRS=($(find "${PACKAGES_DIR}" -name ${RESOURCE_NAME} -exec dirname {} \;))

echo "Building marathon.json.mustache...";
for package_dir in "${PACKAGE_DIRS[@]}"; do
    resource_path="${package_dir}/${RESOURCE_NAME}"
    marathon_tpl_path="${package_dir}/${MARATHON_TPL_NAME}"
    marathon_path="${package_dir}/${MARATHON_NAME}"
    $SCRIPTS_DIR/build_marathon.py "${resource_path}" "${marathon_tpl_path}" "${marathon_path}"
done
echo "OK";
