#!/bin/bash
SCRIPT_DIR=$(dirname $0)
MANAGE_CMD=${SCRIPT_DIR}/runManageCmd.sh

# ==============================================================================================================================
usage () {
  echo "========================================================================================"
  echo "Runs the project's unit tests."
  echo "----------------------------------------------------------------------------------------"
  echo "Usage:"
  echo
  echo "${0}"
  echo "========================================================================================"
  exit 1
}

if [ ! -z "${1}" ]; then
  usage
fi
# ==============================================================================================================================

${MANAGE_CMD} test