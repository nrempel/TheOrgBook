#$/bin/bash
export MSYS_NO_PATHCONV=1

# ==============================================================================
# Script for loading test data into the TheOrgBook database
#
# * Requires curl
# ------------------------------------------------------------------------------
# Usage on Windows (using Git Bash):
#  ./load-all.sh <server URL>
#
# Example:
#  ./load-all.sh dev
#  ./load-all.sh http://localhost:60381
# ------------------------------------------------------------------------------
exitOnError () {
  rtnCd=$?
  if [ ${rtnCd} -ne 0 ]; then
	echo "An error has occurred while loading data!  Please check the previous output message(s) for details."
    exit ${rtnCd}
  fi
}
# ------------------------------------------------------------------------------
API_PREFIX=api/v1
BULK_PATH=bulk
# ==============================================================================

if [ -z "${1}" ]; then
  echo Incorrect syntax
  echo USAGE ${0} "<server URL>"
  echo Example: ${0} dev
  echo "Where <server URL> is one of dev, test, prod or a full URL"
  exit
fi

# Before starting, remove the cookie authentication file.
# The ./load.sh script will add it if needed for the remainder of the calls
if [ -e cookie ]; then
  rm cookie
fi

# Generated by: "ls */*.json" and then set to a variable via regex
# Replace this section with the ls text, highlight it and regex replace
# In atom find: ^(.*)/ and replace: $1=$1/
DoingBusinessAs=DoingBusinessAs/DoingBusinessAs_VODBA.json
InactiveClaimReason=InactiveClaimReason/InactiveClaimReason_DEAC.json
IssuerService=IssuerService/IssuerService_ISVC.json
Jurisdiction=Jurisdiction/Jurisdiction_JUR.json
Location=Location/Location_VOL.json
LocationOrg=LocationOrg/LocationOrg_LOCORG.json
LocationType=LocationType/LocationType_VLT.json
permissions=permissions/permissions_Perms.json
rolepermission=rolepermission/rolepermission_RP.json
roles=roles/roles_Role.json
userRole=userRole/userRole_userRole.json
users=users/users_user.json
VerifiableClaim=VerifiableClaim/VerifiableClaim_VOC.json
VerifiableClaimType=VerifiableClaimType/VerifiableClaimType_CT.json
VerifiableOrg=VerifiableOrg/VerifiableOrg_VO.json
VerifiableOrgType=VerifiableOrgType/VerifiableOrgType_VOType.json

# ==============================================================================================
# The order of the loading is important - need to add independent files before dependent ones
# ==============================================================================================

echo Data for TheOrgBook is now loaded via the loading of claims. Details to come...

# Users, Roles, and Permissions ...
# ./load.sh ./${users} ${API_PREFIX}/users/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${roles} ${API_PREFIX}/roles/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${permissions} ${API_PREFIX}/permissions/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${userRole} ${API_PREFIX}/userroles/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${rolepermission} ${API_PREFIX}/rolepermissions/${BULK_PATH} "$@"; exitOnError

# Everything else ...
# ./load.sh ./${InactiveClaimReason} ${API_PREFIX}/inactiveclaimreasons/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${Jurisdiction} ${API_PREFIX}/jurisdictions/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${VerifiableOrgType} ${API_PREFIX}/verifiableorgtypes/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${LocationType} ${API_PREFIX}/locationtypes/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${IssuerService} ${API_PREFIX}/issuerservices/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${VerifiableClaimType} ${API_PREFIX}/verifiableclaimtypes/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${VerifiableOrg} ${API_PREFIX}/verifiableorgs/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${VerifiableClaim} ${API_PREFIX}/verifiableclaims/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${DoingBusinessAs} ${API_PREFIX}/doingbusinessas/${BULK_PATH} "$@"; exitOnError
# ./load.sh ./${Location} ${API_PREFIX}/locations/${BULK_PATH} "$@"; exitOnError