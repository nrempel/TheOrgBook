# ================================================================================================================
# Special deployment parameters needed for injecting a user supplied settings into the deployment configuration
# ----------------------------------------------------------------------------------------------------------------
# The results need to be encoded as OpenShift template parameters for use with oc process.
# ================================================================================================================

generateUsername() {
  # Generate a random username and Base64 encode the result ...
  _userName=USER_$( cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1 )
  _userName=$(echo -n "${_userName}"|base64)
  echo ${_userName}
}

generatePassword() {
  # Generate a random password and Base64 encode the result ...
  _password=$( cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9_' | fold -w 16 | head -n 1 )
  _password=$(echo -n "${_password}"|base64)  
  echo ${_password}
}

generateConfigMap() {  
  _config_map_name=${1}
  _source_file=${2}
  _output_format=${3}
  _output_file=${4}
  if [ -z "${_config_map_name}" ] || [ -z "${_source_file}" ] || [ -z "${_output_format}" ] || [ -z "${_output_file}" ]; then
    echo -e \\n"generateConfigMap; Missing parameter!"\\n
    exit 1
  fi

  oc create configmap ${_config_map_name} --from-file ${_source_file} --dry-run -o ${_output_format} > ${_output_file}
}

CONFIG_MAP_NAME=rabbitmq-enabled-plugins
CONFIG_MAP_SOURCE_FILE=../enabled_plugins
CONFIG_MAP_OUTPUT_FORMAT=json
CONFIG_MAP_OUTPUT_FILE=${CONFIG_MAP_NAME}-configmap_DeploymentConfig.json

generateConfigMap "${CONFIG_MAP_NAME}" "${CONFIG_MAP_SOURCE_FILE}" "${CONFIG_MAP_OUTPUT_FORMAT}" "${CONFIG_MAP_OUTPUT_FILE}"

_userName=$(generateUsername)
_password=$(generatePassword)

SPECIALDEPLOYPARMS="-p DEFAULT_USER_NAME=${_userName} -p DEFAULT_PASSWORD=${_password}"
echo ${SPECIALDEPLOYPARMS}