# Maintainer: SpineEyE <at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=pulseaudio-hsphfpd
pkgname=(pulseaudio-hsphfpd libpulse-hsphfpd pulseaudio-{zeroconf,lirc,jack,bluetooth,equalizer}-hsphfpd)
pkgdesc="A fork of pulseaudio providing superior bluetooth headset functionality"
pkgver=13.0
pkgrel=3
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile rtkit libsoxr
             speexdsp tdb systemd dbus avahi bluez bluez-libs jack2 sbc
             lirc openssl fftw orc gtk3 webrtc-audio-processing check git meson
             xmltoman)
_branch=hsphfpd
source=("git+https://gitlab.freedesktop.org/pali/pulseaudio.git#branch=$_branch"
        0001-meson-Define-TUNNEL_SINK-for-module-tunnel-sink.patch)
sha256sums=('SKIP'
            '4ff133e2847baad5bb6798b5816d67551cfba2efabb2f1f348628d7217abd07d')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd pulseaudio

  # Freeze version before patching
  ./git-version-gen doesnt-exist >.tarball-version

  # https://bugs.archlinux.org/task/63755
  git apply -3 ../0001-meson-Define-TUNNEL_SINK-for-module-tunnel-sink.patch
}

build() {
  arch-meson pulseaudio build \
    -D gcov=false \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D udevrulesdir=/usr/lib/udev/rules.d
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
  ninja -C build test-daemon
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_pulseaudio-hsphfpd() {
  depends=("libpulse-hsphfpd=$pkgver-$pkgrel" rtkit libltdl speexdsp tdb orc libsoxr
           webrtc-audio-processing)
  optdepends=('pulseaudio-alsa-hsphfpd: ALSA configuration (recommended)')
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  install=pulseaudio.install
  replaces=('pulseaudio-xen<=9.0' 'pulseaudio-gconf<=11.1')
  provides=("pulseaudio=$pkgver-$pkgrel")
  conflicts=(pulseaudio)

  local pulsever=$(cd pulseaudio; ./git-version-gen .tarball-version)
  while [[ $pulsever = *.*.* ]]; do
    pulsever=${pulsever%.*}
  done
  pulsever=${pulsever%%-*}

  DESTDIR="$pkgdir" meson install -C build

  cd "$pkgdir"

  # Assumes that any volume adjustment is intended by the user, who can control
  # each app's volume. Misbehaving clients can trigger earsplitting volume
  # jumps. App volumes can diverge wildly and cause apps without their own
  # volume control to fall below sink volume; a sink-only volume control will
  # suddenly be unable to make such an app loud enough.
  sed -e '/flat-volumes/iflat-volumes = no' \
      -i etc/pulse/daemon.conf

  # Superseded by socket activation
  sed -e '/autospawn/iautospawn = no' \
      -i etc/pulse/client.conf

  # Disable cork-request module, can result in e.g. media players unpausing
  # when there's a Skype call incoming
  sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' \
      -i usr/bin/start-pulseaudio-x11

  # Required by qpaeq
  sed -e '/Load several protocols/aload-module module-dbus-protocol' \
      -i etc/pulse/default.pa

  rm -r etc/dbus-1

### Split libpulse
  _pick libpulse etc/pulse/client.conf
  _pick libpulse usr/bin/pa{cat,ctl,dsp,mon,play,rec,record}
  _pick libpulse usr/lib/libpulse{,-simple,-mainloop-glib}.so*
  _pick libpulse usr/lib/{cmake,pkgconfig}
  _pick libpulse usr/lib/pulseaudio/libpulse{dsp,common-*}.so
  _pick libpulse usr/include
  _pick libpulse usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1
  _pick libpulse usr/share/man/man5/pulse-client.conf.5
  _pick libpulse usr/share/vala

### Split modules
  local moddir=usr/lib/pulse-$pulsever/modules

  _pick zeroconf $moddir/libavahi-wrap.so
  _pick zeroconf $moddir/module-zeroconf-{publish,discover}.so
  _pick zeroconf $moddir/module-raop-discover.so

  _pick lirc $moddir/module-lirc.so

  _pick jack $moddir/module-jack-{sink,source}.so
  _pick jack $moddir/module-jackdbus-detect.so

  _pick bluetooth $moddir/libbluez5-util.so
  _pick bluetooth $moddir/module-bluetooth-{discover,policy}.so
  _pick bluetooth $moddir/module-bluez5-{discover,device}.so

  _pick equalizer $moddir/module-equalizer-sink.so
  _pick equalizer usr/bin/qpaeq
}

package_libpulse-hsphfpd() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxtst libsm libsndfile systemd)
  provides=(libpulse{,-simple,-mainloop-glib}.so "libpulse=$pkgver-$pkgrel")
  conflicts=(libpulse)
  license=(LGPL)
  backup=(etc/pulse/client.conf)

  mv libpulse/* "$pkgdir"
}

package_pulseaudio-zeroconf-hsphfpd(){
  pkgdesc="Zeroconf support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" avahi openssl)
  provides=("pulseaudio-zeroconf=$pkgver-$pkgrel")
  conflicts=(pulseaudio-zeroconf)

  mv zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-hsphfpd(){
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" lirc)
  provides=("pulseaudio-lirc=$pkgver-$pkgrel")
  conflicts=(pulseaudio-lirc)

  mv lirc/* "$pkgdir"
}

package_pulseaudio-jack-hsphfpd(){
  pkgdesc="Jack support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" jack)
  provides=("pulseaudio-jack=$pkgver-$pkgrel")
  conflicts=(pulseaudio-jack)

  mv jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-hsphfpd(){
  pkgdesc="Bluetooth support for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" bluez bluez-libs sbc)
  provides=("pulseaudio-bluetooth=$pkgver-$pkgrel")
  conflicts=(pulseaudio-bluetooth)

  mv bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-hsphfpd(){
  pkgdesc="Equalizer for PulseAudio"
  depends=("pulseaudio-hsphfpd=$pkgver-$pkgrel" python-{pyqt5,dbus,sip} fftw)
  provides=("pulseaudio-equalizer=$pkgver-$pkgrel")
  conflicts=(pulseaudio-equalizer)

  mv equalizer/* "$pkgdir"
}

# vim:set sw=2 et:
