pkgname=mingw-w64-gdal
pkgver=3.5.0
pkgrel=1
pkgdesc="A translator library for raster geospatial data formats (mingw-w64)"
arch=('any')
url="http://www.gdal.org/"
license=('custom')
depends=('mingw-w64-curl' 'mingw-w64-hdf5' 'mingw-w64-netcdf' 'mingw-w64-libgeotiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-sqlite' 'mingw-w64-postgresql' 'mingw-w64-geos' 'mingw-w64-giflib' 'mingw-w64-libfreexl' 'mingw-w64-libheif' 'mingw-w64-libwebp' 'mingw-w64-expat' 'mingw-w64-mariadb-connector-c')
makedepends=('perl' 'mingw-w64-cmake' 'mingw-w64-wine' 'protobuf')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-${pkgver}.tar.gz")
sha256sums=('3affc513b8aa5a76b996eca55f45cb3e32acacf4a262ce4f686d4c8bba7ced40')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/gdal-$pkgver
}

build() {
  cd "${srcdir}/gdal-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DGDAL_USE_MYSQL=OFF -DBUILD_PYTHON_BINDINGS=OFF ..
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gdal-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
