# Maintainer: matoro <matoro@airmail.cc>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Vivien Didelot <vivien+aur@didelot.org>
# Contributor: hashworks <mail@hashworks.net>

pkgname=i3blocks-contrib-git
pkgver=v1.4.0.r157.21708ed
pkgrel=2
pkgdesc='Official repository of community contributed blocklets'
arch=('armv7h' 'i686' 'x86_64')
groups=('i3')
url="https://github.com/vivien/i3blocks-contrib"
license=('GPL3')
makedepends=('git')
# Please keep those ordered by script-name. Packages for more than 2 scripts go on top
optdepends=('coreutils: For some scripts'
            'python3: For some scripts'
            'perl: For some scripts'
            'ttf-font-awesome: For some scripts'
            'awk: For some scripts'
            'glibc: For some scripts'
            'iproute2: For some network scripts'
            'openafs: For afs script'
            'pacman-contrib: For arch-update script'
            'python-requests: For aur-update script'
            'libnotify: For aur-update script'
            'acpi: For battery scripts'
            'yad: For calendar script'
            'xdotool: For calendar script'
            'sysstat: For cpu_usage & disk-io script'
            'docker: For docker script'
            'python-keyring: For email script'
            'gnome-keyring: For email script'
            'wireless_tools: For essid script'
            'nvidia-settings: For gpu-load script'
            'xorg-setxkbmap: For key_layout script'
            'procps-ng: For keyindicator script'
            'kubectl: For kubernetes script'
            'spotify: For mediaplayer script'
            'vlc: For mediaplayer script'
            'audacious: For mediaplayer script'
            'xmms2: For mediaplayer script'
            'mplayer: For mediaplayer script'
            'mpc: For mediaplayer script'
            'cmus: For mediaplayer script'
            'rhythmbox: For mediaplayer script'
            'xorg-xrandr: For monitor_manager script'
            'arandr: For monitor_manager script'
            'networkmanager: For nm-vpn script'
            'openvpn: For openvpn script'
            'rofi: For rofi-calendar & shutdown_menu script'
            'util-linux: For rofi-calendar & usb script'
            'zenity: For shutdown_menu script'
            'systemd: For shutdown_menu script'
            'curl: For tahoe-lafs script'
            'jq: For tahoe-lafs script'
            'tahoe-lafs: For tahoe-lafs script'
            'lm_sensors: For temperature script'
            'pulseaudio: For pulseaudio & volume script'
            'alsa-utils: For pulseaudio & volume script'
            'iw: For wlan-dbm script'
            'mpv: For ytdl-mpv script'
            'xclip: For ytdl-mpv script'
            'youtube-dl: For ytdl-mpv script')
provides=("i3blocks-contrib")
conflicts=("i3blocks-contrib")
source=("git+https://github.com/vivien/i3blocks-contrib")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}"/i3blocks-contrib
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package () {
  cd "${srcdir}"/i3blocks-contrib
  mkdir -p "${pkgdir}"/usr/lib/i3blocks
  find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' -exec cp -r {} "${pkgdir}"/usr/lib/i3blocks/ \;
}
