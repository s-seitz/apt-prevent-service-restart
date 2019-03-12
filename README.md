# apt-prevent-service-restart
Configurable scripts to prevent services from getting restarted during dpkg and apt/apt-get actions.

This comes handy, if you're for example running a mysql-server and don't want to have it restart during
apt upgrade. It could also be desirable to not blacklist services from unattended-upgrades and instead
prevent them from automatic restarts. Your mileage may vary.

It's implemented via simple hook-scripts:

## /usr/sbin/policy-rc.d
If this script exists and returns 101, update-rc start/stop/restart commands are refused.

## /etc/apt/apt.conf.d/80policyrc
This configuration snippet contains PRE and POST hooks to log and report the prevented services.
This is just for convenience to get a consolidated syslog and stdout view of the respective
services.

## /usr/sbin/policy-rc.d-report
A script for housekeeping/reporting (called via PRE and POST hooks)

## /etc/default/policy-rc
Tiny configuration file. Take a look :)

