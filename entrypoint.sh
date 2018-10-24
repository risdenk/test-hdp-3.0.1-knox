#!/usr/bin/env bash

set -eu

/usr/hdp/current/knox-server/bin/ldap.sh start
/usr/hdp/current/knox-server/bin/gateway.sh start

tail -f /usr/hdp/current/knox-server/logs/*
