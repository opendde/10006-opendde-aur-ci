# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libasi
pkgver=1.9.3
pkgrel=1
pkgdesc="libasi used by INDI ASI drivers. Please note that for sake of simplicity package version is the version of libindi not a version of used ASI SDKs from ZWO. This package contains ASI Camera SDK, ASI EFW SDK, ASI EAF SDK and USBST4 SDK."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64)
depends=(libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("4e71a8106fcdf6248486b18f04f4013332b0722b4942b90fbf01770d8037d3dc")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    ../indi-3rdparty-${pkgver}/libasi
  make
}


package() {
  cd build
  make DESTDIR="$pkgdir" install
}
