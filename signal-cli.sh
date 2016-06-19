#!/bin/sh
CP="/usr/share/java/libmatthew-unix-java/unix.jar":"/usr/share/java/commons-logging/commons-logging.jar"
for name in /usr/share/java/signal-cli/*.jar ; do
	CP=$CP:"$name"
done
exec /usr/bin/java -cp "$CP" org.asamk.signal.Main "$@"
