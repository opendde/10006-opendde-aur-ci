#!/bin/sh

launcher_msg() {
    if [ -x "$(which notify-send 2>/dev/null)" ]; then
	notify-send -u low -i eve 'EVE Online Launcher' "$@"
    fi
    echo "$(basename $0): $@"
}

check_install() {
    if [ -d "$CONFDIR" ]; then
	if [ -r "$CONFDIR/EVE.conf" ]; then
	    SHAREDIR=$(grep SharedCacheFolder $CONFDIR/EVE.conf | cut -d= -f2)
	fi
    fi
    SHAREDIR=${SHAREDIR:-$HOME/.eve/}
    [ ! -d "$SHAREDIR" ] && SHAREDIR=""
    if [ "x$SHAREDIR" != "x$EVEDIR/SharedCache/" ]; then
	launcher_msg "Please wait, preparing environment in $EVEDIR"
	mkdir -p $CONFDIR
	echo "[General]" >$CONFDIR/EVE.conf
	echo "SharedCacheFolder=$EVEDIR/SharedCache/" >>$CONFDIR/EVE.conf
	echo "UseCustomWine=true" >>$CONFDIR/EVE.conf
	echo "CustomWinePath=$WINEPATH/wine" >>$CONFDIR/EVE.conf
	mkdir -p $EVEDIR/SharedCache
	tar xf $SETUPDIR/lib/launcher-$ELVER.tar.xz -C $EVEDIR
	if [ -d "$SHAREDIR/ResFiles/" ]; then
	    mv $SHAREDIR/ResFiles/ $EVEDIR/SharedCache/
	    mv $SHAREDIR/*.txt $EVEDIR/SharedCache/
	    rm -rf $SHAREDIR
	fi
    fi
}

check_steam() {
    if [ ! -r "$LAUNCHER/steam_appid.txt" -a -x "$(which steam 2>/dev/null)" ]; then
	echo "8500" >$LAUNCHER/steam_appid.txt
    fi
}

check_wine() {
    EVECONF=$CONFDIR/EVE.conf
    UCW=$(grep UseCustomWine $EVECONF | cut -d= -f2)
    if [ "x$UCW" = "xtrue" ]; then
	WINEPATH=$(grep CustomWinePath $EVECONF | cut -d= -f2)
	WINEPATH=${WINEPATH%/*}
    else
	launcher_msg "Error: Custom wine not set!"
	exit 1
    fi
    WINEDATE=$(ls -l --time-style=+%s $WINEPATH/wineserver | cut -d' ' -f6)
    INSTWINE=$(cat $EVEDIR/SharedCache/wineenv/.update-timestamp 2>/dev/null)
    if [ "x$WINEDATE" != "x$INSTWINE" ]; then
	if [ -x "$WINEPATH/wine" ]; then
	    WINEPREFIX=$EVEDIR/SharedCache/wineenv
	    env WINEARCH=win32 \
		WINEPREFIX=$WINEPREFIX \
		WINEDEBUG=-all \
		WINEDLLOVERRIDES="mscoree,mshtml,winemenubuilder.exe=d" \
		$WINEPATH/wineboot
	    env WINEPREFIX=$WINEPREFIX $WINEPATH/wine reg delete \
		'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices' \
		/v winemenubuilder /f >/dev/null
	    env WINEPREFIX=$WINEPREFIX $WINEPATH/wine reg add \
		'HKEY_CURRENT_USER\Software\Wine\DllOverrides' \
		/v winemenubuilder.exe /f >/dev/null
	    env WINEPREFIX=$WINEPREFIX WINE=$WINEPATH/wine \
		$(which winetricks) -q winxp >/dev/null
	else
	    launcher_msg "Error: No wine in $WINEPATH found!"
	    exit 1
	fi
    fi
}

ELVER="1385477"
QTVER="5.11"
SHAREDIR=""
CONFDIR="$HOME/.config/CCP"
EVEDIR="$HOME/.local/lib/EVE"
LAUNCHER="$EVEDIR/Launcher"
SETUPDIR="/opt/evesetup"
WINEPATH="/usr/bin"

check_install
check_wine
check_steam

cd $EVEDIR
exec $LAUNCHER/evelauncher.sh
