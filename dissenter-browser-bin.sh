#!/usr/bin/env bash

if [[ ! (-r /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ) ]]; then
    >&2 echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
    FLAG="--class=dissenter-browser --no-sandbox"
fi

exec "/opt/gab/dissenter/dissenter-browser" $@ $FLAG 
