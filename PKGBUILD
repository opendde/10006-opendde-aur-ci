# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-git
pkgver=0.4.2.r69.gd398018
pkgrel=2
pkgdesc="A music player aimed at audio enthusiasts and music collectors"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://www.strawbs.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt5-base qt5-x11extras
         sqlite3 udisks2 dbus alsa-lib libcdio
         libpulse libimobiledevice libplist libusbmuxd libgpod libmtp)
makedepends=(git cmake boost)
optdepends=(gst-libav
            gst-plugins-bad
            gst-plugins-ugly)
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/-git/}"
  install -d strawberry-build
}

build() {
  cd "${pkgname/-git/}/strawberry-build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_TAGLIB=OFF \
    -DENABLE_STREAM_DEEZER=OFF \
    -DENABLE_DEEZER=OFF \
    -DENABLE_PHONON=OFF \
    -DENABLE_SPARKLE=OFF \
    -DENABLE_VLC=OFF \
    -DENABLE_XINE=OFF
  make
}

package() {
  cd "${pkgname/-git/}/strawberry-build"
  make DESTDIR="${pkgdir}" install
}
