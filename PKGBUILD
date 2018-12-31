# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp
pkgver=0.1
pkgrel=1
pkgdesc='Open-Source Music Player'
url='https://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gst-libav gst-plugins-bad gst-plugins-base 
         gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gtkmm3
         libclastfm libconfig sqlite taglib)
makedepends=(git)
provides=('omp')
conflicts=('omp' 'omp-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheWiseNoob/OMP/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make install DESTDIR=${pkgdir}
}
