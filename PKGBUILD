pkgname=mingw-w64-gdk-pixbuf2
pkgver=2.36.0
pkgrel=2
pkgdesc='An image loading library (mingw-w64)'
arch=(any)
url='http://www.gtk.org'
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure')
depends=(
  'mingw-w64-crt'
  'mingw-w64-glib2>=2.37.6'
  'mingw-w64-jasper'
  'mingw-w64-libpng'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libtiff')
options=(!strip !buildflags staticlibs)
source=(
  "https://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-$pkgver.tar.xz")
sha256sums=('85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --enable-relocations \
      --with-included-loaders \
      --with-libjasper
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtL1 ${_arch}-strip
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtL1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtL1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share/man"
    cd ..
  done
}
