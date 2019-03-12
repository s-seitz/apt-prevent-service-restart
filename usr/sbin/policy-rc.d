#!/bin/bash -e
#
# /usr/sbin/policy-rc.d
#
# This script is hooked by apt/dpkg service stop/start/restart-actions
# Depending on the RC, apt/dpkg prevents touching the state of a service.
# Refer to invoke-rc LSB Returncodes (README-invoke-rc.d-RC.md)
#
RC_OK=0
RC_SCRIPT_UNKNOWN=100
RC_ACTION_NOT_ALLOWED=101

# shellcheck source=/dev/null
test -f "/etc/default/policy-rc" && source "/etc/default/policy-rc"

# disabled by default.
DISABLE_RESTART_DURING_UPDATE=${DISABLE_RESTART_DURING_UPDATE:-0}
POLICY_RC_TMPFILE="${POLICY_RC_TMPFILE:-/tmp/policy-rc.tmp}"
SYSLOG_PRIORITY="${SYSLOG_PRIORITY:-local0.info}"

SERVICE_NAME="$1"
SERVICE_ACTION="$2"

if [ -z "${SERVICE_NAME}" ]
then
  RC=$RC_SCRIPT_UNKNOWN
elif [ $((DISABLE_RESTART_DURING_UPDATE)) -eq 1 ]
then
  msg="Prevented Service ${SERVICE_NAME} from Action ${SERVICE_ACTION}"
  echo "$(date +"%b %e %X") $msg" >> "${POLICY_RC_TMPFILE}"
  logger --priority "${SYSLOG_PRIORITY}" "$msg"
  RC=$RC_ACTION_NOT_ALLOWED
else
	RC=$RC_OK
fi
exit $RC

