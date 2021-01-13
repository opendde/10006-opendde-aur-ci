# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmium
pkgver=2.16.0
pkgrel=1
pkgdesc="Fast and flexible C++ library for working with OpenStreetMap data."
url="https://osmcode.org/libosmium/"
arch=('any')
license=('custom')
makedepends=('cmake')
depends=('expat' 'zlib' 'bzip2' 'boost' 'boost-libs' 'protozero')
optdepends=('sparsehash: sparse-mem-table index map'
            'gdal: convert OSM geometries into OGR geometries'
            'geos: convert OSM geometries into GEOS geometries'
            'proj: project OSM coordinates into spatial reference systems'
            'doxygen: build Libosmium API documentation')
conflicts=('libosmium-git')
provides=('libosmium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osmcode/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake \
    -DINSTALL_GDALCPP=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	  ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ctest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('42bbef97226d7db7ce3eeb474603e5b1f2f0f86cec85498868e9416e7cdf5bd5')
