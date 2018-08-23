# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Loren Copeland <thisisquitealongname at gm--l> 
# based on jack2 PKGBUILD by Ray Rashif <schiv@archlinux.org>

_name=jack2
pkgbase=jack2-git
pkgname=('jack2-git' 'jack2-dbus-git')
pkgdesc="The next-generation JACK with SMP support"
pkgver=1.9.12.r17.g21f67b38
pkgrel=1
epoch=1
arch=('x86_64')
url="http://jackaudio.org/"
license=('GPL')
groups=('pro-audio')
makedepends=('python2' 'celt' 'opus' 'libsamplerate' 'git' 'libffado')
optdepends=('a2jmidid: Expose legacy ALSA sequencer applications in JACK MIDI'
            'realtime-privileges: Acquire realtime privileges')
source=("${pkgname}::git+https://github.com/jackaudio/jack2")
md5sums=('SKIP')

prepare() {
  cp -av ${pkgname[0]} ${pkgname[1]}
}

pkgver() {
  cd ${pkgname[0]}
  # get commits since last unannotated tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;'
}

build() {
  cd ${pkgname[0]}
  # configure jack2
  python2 waf configure --prefix=/usr \
                        --htmldir="/usr/share/doc/${pkgbase}/" \
                        --freebob=no \
                        --classic \
                        --dbus

  # configure jack2-dbus
  cd "${srcdir}/${pkgname[1]}"
  python2 waf configure --prefix=/usr \
                        --htmldir="/usr/share/doc/${pkgbase}/" \
                        --freebob=no \
                        --dbus

  # build jack2
  cd "${srcdir}/${pkgname[0]}"
  python2 waf build
  # build jack2-dbus
  cd "${srcdir}/${pkgname[1]}"
  python2 waf build
}

package_jack2-git() {
  pkgdesc="JACK low-latency audio server for multi-processor machines (daemon activation)"
  depends=('celt' 'libffado' 'opus' 'python-dbus')
  conflicts=('jack' 'jack2-dbus')
  provides=('jack')

  cd ${pkgname}
  python2 waf install --destdir="$pkgdir"
}

package_jack2-dbus-git() {
  pkgdesc="JACK low-latency audio server for multi-processor machines (only dbus activation)"
  depends=('celt' 'libffado' 'opus' 'python-dbus')
  conflicts=('jack' 'jack2')
  provides=('jack' 'jack2')

  cd ${pkgname}
  python2 waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
