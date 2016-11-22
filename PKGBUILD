
pkgname=polyclipping
pkgver=6.4
pkgrel=1
pkgdesc="Polygon clipping library (also known as clipper)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/polyclipping/"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/polyclipping/clipper_ver${pkgver}.zip")
sha256sums=('cfa08836e7838773ac79d13e14daf1ce7d2f4faee77329798614813b79151e39')

build() {
  cd "$srcdir"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../cpp
  make
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="$pkgdir"
}
