# apt-prevent-service-restart
Prevent services from getting restarted during dpkg and apt/apt-get action

This is done by configurable hook-scripts.

## /usr/sbin/policy-rc.d
If this script exists and returns 101, update-rc start/stop/restart commands are refused.

## /etc/apt/apt.conf.d/80policyrchooks
This script contains PRE and POST hooks to log and report the prevented services.
This is just for convenience.

## /usr/sbin/policy-rc.d-report
A script for housekeeping/reporting (called via PRE and POST hooks)

## /etc/default/policy-rc
Tiny configuration file. Take a look :)

