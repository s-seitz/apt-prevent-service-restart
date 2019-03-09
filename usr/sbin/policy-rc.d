#!/bin/bash -e
# Hook File

test -f /etc/default/policy-rc && . /etc/default/policy-rc
DISABLE_RESTART_DURING_UPDATE=${DISABLE_RESTART_DURING_UPDATE:-0}
POLICY_RC_TMPFILE=${POLICY_RC_TMPFILE:-/tmp/policy-rc.tmp}

SERVICE_NAME=$1
SERVICE_ACTION=$2

if [ $[DISABLE_RESTART_DURING_UPDATE] -eq 1 ]
then
	msg="Prevented Service ${SERVICE_NAME} from Action ${SERVICE_ACTION}"
	echo "$(date +"%b %e %X") $msg" >> ${POLICY_RC_TMPFILE}
	echo $msg | logger
	RC=101
else
	RC=0
fi
exit $RC

