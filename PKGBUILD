# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev at orum dot in>

_basename=libinput
pkgname="lib32-$_basename"
pkgver=1.17.3
pkgrel=1
pkgdesc="Input device management and event handling library (32-bit)"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('lib32-mtdev' 'lib32-systemd' 'lib32-libevdev' 'lib32-libwacom' "$_basename")
# upstream doesn't recommend building docs
makedepends=('gcc-multilib' 'lib32-gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('3d1ab4362ede886996795d700a938d20e04cd922e8f9598fe9346f9f93e149119526fb324a096787b4b8a47bf3e5613130bcd874f10df86761031710d2acc792'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson $_basename-$pkgver build \
    --libdir=/usr/lib32 \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf "$pkgdir/usr/"{bin,lib,share,include}
}
