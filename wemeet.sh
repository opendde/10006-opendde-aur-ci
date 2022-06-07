#!/bin/sh
export PATH=$PATH:/opt/wemeet/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/wemeet
export QT_PLUGIN_PATH="/usr/lib/qt/plugins"
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_STYLE_OVERRIDE=fusion # 解决使用自带qt情况下，字体颜色全白看不到的问题
FONTCONFIG_DIR=$HOME/.config/fontconfig
unset WAYLAND_DISPLAY

# paste from builtin scripts
if [ $XMODIFIERS ]
    then
        im_module=$XMODIFIERS
        echo 'use XMODIFIERS'
        export QT_IM_MODULE=${im_module#*=}
elif [ $GTK_IM_MODULE ]
    then
        echo 'use GTK_IM_MODULE'
        export QT_IM_MODULE=${GTK_IM_MODULE}
fi
echo ${QT_IM_MODULE}

if [ -f "/usr/bin/bwrap" ];then
    mkdir -p $FONTCONFIG_DIR
    bwrap --dev-bind / / --tmpfs $HOME/.config --ro-bind $FONTCONFIG_DIR $FONTCONFIG_DIR wemeetapp $*;
else
    exec wemeetapp $*;
fi; 
