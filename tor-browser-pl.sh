#!/usr/bin/env bash
#
# Copyright (C) 2009 Benjamin Drung <bdrung at ubuntu dot com>
# Copyright (C) 2012 Alessio Sergi <al3hex at gmail dot com>
# modified 2012 for tor-browser (Max Roder <maxroder at web dot de>)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

# filled by the PKGBUILD
NAME='REPL_NAME'
VERSION='REPL_VERSION'
LANGUAGE="REPL_LANGUAGE"
PKGARCH="REPL_ARCH"

DIRECTORY=~/.$NAME
INSTALL_DIRECTORY=$DIRECTORY/INSTALL
VERSION_FILE=$DIRECTORY/VERSION
LOG_FILE=$DIRECTORY/LOG
ARCH=$(getconf LONG_BIT)

notify() {
  local title="$1"
  local message="$2"

  if [ $(which zenity 2>/dev/null) ]; then
    zenity --info --title "$title" --text "$message"
  elif [ $(which notify-send 2>/dev/null) ]; then
    notify-send "$title" "$message"
  elif [ $(which kdialog 2>/dev/null) ]; then
    kdialog --title "$title" --passivepopup "$message"
  else
    echo -e "$0: [$title] $message" >&2
  fi
}

update() {
	echo "$0: Extracting files to $INSTALL_DIRECTORY." >> $LOG_FILE
	rm -rf $INSTALL_DIRECTORY/*
	tar --strip-components=1 -xJf /opt/$NAME/tor-browser-linux${ARCH}-${VERSION}_${LANGUAGE}.tar.xz \
		-C $INSTALL_DIRECTORY >> $LOG_FILE 2>&1 || notify "Error" \
		"The tor-browser archive could not be extracted to your home directory. \
		\nCheck permissions of $INSTALL_DIRECTORY. \
		\nThe error log can be found in $LOG_FILE."

	[[ -f $INSTALL_DIRECTORY/start-tor-browser ]] && echo $VERSION > $VERSION_FILE
}

usage() {
  cat <<EOF
Usage: ${0##*/} [option]

Options:
  -h				Show this help message and exit
  -u				Force update of the copy in your home directory
  -r <directory>	The Tor-Browser directory to use
EOF
}

while getopts ':hu' opt; do
	case "$opt" in
		h) usage; exit 0 ;;
		u) update=1 ;;
		:) echo "$0: Option '-$OPTARG' requires an argument" >&2
			exit 1 ;;
		*) echo "$0: Invalid option '-$OPTARG'" >&2
			usage; exit 1 ;;
	esac
done

# create directory, if it is missing (e.g. first run)
[[ ! -d "$INSTALL_DIRECTORY" ]] && mkdir -p "$INSTALL_DIRECTORY"
cd "$DIRECTORY"

# create version file if missing
[[ ! -f $VERSION_FILE ]] && echo 0 > $VERSION_FILE

#get installed version
while read line
do
	INSTALLED_VERSION=$line
done < $VERSION_FILE

# start update if old or no tor-browser is installed
if [[ "$INSTALLED_VERSION" == "$VERSION" ]] && [[ $update != 1 ]]; then
	# clear log
	> $LOG_FILE
else
	echo "$0: Your version in $DIRECTORY is outdated or you do not have installed $NAME yet." > $LOG_FILE
	update
fi

# start tor-browser
cd $INSTALL_DIRECTORY && './start-tor-browser'
