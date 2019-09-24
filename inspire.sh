#!/bin/bash

# This script launches ActivInspire. It is partially based on the upstream launch script, with obsolete and Ubuntu-specific stuff fixed or removed.

cd /opt/activsoftware

# Promethean software has a bug that often causes it to hang when attempting to close it using the GUI. So we need to kill those instances before launching a new one.
killall -q Inspire

# ActivInspire needs 32-bit Java for the equation editor (see optional dependencies).
export JAVA_HOME=/usr/lib32/jvm/java32-8-jre/jre

# Promethean ships ActivInspire with a bunch of libraries. We can't recompile it and there are less problems when using this library versions.
export LD_LIBRARY_PATH="/opt/activsoftware:/opt/activsoftware/workbench:/opt/activsoftware/workbench/lib:/opt/activsoftware/32bit_libs_for_64bit_OS:$LD_LIBRARY_PATH"
export GST_PLUGIN_PATH="/opt/activsoftware/32bit_libs_for_64bit_OS:$GST_PLUGIN_PATH"
export QTWEBKIT_PLUGIN_PATH="/opt/activsoftware/32bit_libs_for_64bit_OS:$QTWEBKIT_PLUGIN_PATH"

# Launch and open the file if one was given as an argument.
./Inspire "$@"

# This is a lock file. Since ActivInspire hangs when attempting to close it, it never gets deleted, causing problems.
rm -f /dev/shm/sem.promethean