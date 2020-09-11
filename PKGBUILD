# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=lib32-libudev0-shim-nosystemd
pkgver=1
pkgrel=4
pkgdesc='libudev.so.0 compatibility library for systems with newer udev versions (32 bit)'
url='https://github.com/archlinux/libudev0-shim'
arch=('x86_64')
license=('GPL')
provides=('lib32-libudev0' 'lib32-libudev0-shim')
conflicts=('lib32-libudev0' 'lib32-libudev0-shim')
optdepends=('lib32-eudev: eudev support'
	    'lib32-systemd: systemd support'
	    'eudev: 64bit support'
            'libudev0-shim: 64bit support')
source=(libudev0-shim.tar.gz::https://github.com/archlinux/libudev0-shim/archive/v${pkgver}.tar.gz)
sha512sums=('794810b20be6391cb6af53c2c49705f8bd884dd6eb5d1fd5b659481a01490205cc60e0f1904c020fb0e59e984583762ba6775f977a78b95a40ba82eb93965387')

build() {
  cd libudev0-shim-${pkgver}
  unset LDFLAGS
  make CC="gcc -m32"
}

package() {
  cd libudev0-shim-${pkgver}
  install -Dm 755 libudev.so.0.0.9999 -t "${pkgdir}/usr/lib32"
  ln -s libudev.so.0.0.9999 "${pkgdir}/usr/lib32/libudev.so.0"
}

# vim: ts=2 sw=2 et:

