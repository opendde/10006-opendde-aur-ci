# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-full-git
pkgver=0.4.2.r69.gd398018
pkgrel=2
pkgdesc="A music player aimed at audio enthusiasts and music collectors, all options and engines"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib
         libcdio xine-lib vlc libgpod liblastfm-qt5
         libpulse  libmtp  libusbmuxd libplist libimobiledevice phonon-qt5-backend)
makedepends=(git cmake boost)
optdepends=(gst-libav
            gst-plugins-bad
            gst-plugins-ugly)
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-full-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/-full-git/}"
  install -d strawberry-build
}

build() {
  cd "${pkgname/-full-git/}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DEEZER=OFF \
    -DENABLE_PHONON=ON
  make
}

package() {
  cd "${pkgname/-full-git/}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
