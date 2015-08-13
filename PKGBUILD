# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname=libtiff4
pkgver=3.9.7
pkgrel=3
pkgdesc="Library for manipulation of TIFF images (legacy version, provides libtiff.so.4)"
arch=('i686' 'x86_64')
url="http://www.remotesensing.org/libtiff/"
license=('custom')
depends=('libjpeg' 'zlib' 'libtiff')
makedepends=('freeglut')
optdepends=('freeglut: for using tiffgt')
options=('!libtool')
source=(http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz)
sha1sums=('3b35071ebef1aad463ffd2a8904bec7037734dcd')

build() {
  cd "${srcdir}/tiff-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/tiff-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Cleaning binaries and headers
  rm -rf ${pkgdir}/usr/bin
  rm -rf ${pkgdir}/usr/include
  # Remove documentation
  rm -rf ${pkgdir}/usr/share/man
  rm -rf ${pkgdir}/usr/share/doc
  # Fix libraries
  cd ${pkgdir}/usr/lib/
  # Remove main library, this is supplied by libtiff package
  rm -f libtiff.{a,so} libtiffxx.{a,so}
  rm -f libtiff*.so.3
  # http://www.asmail.be/msg0055009514.html
  ln -sf libtiff.so.${pkgver} libtiff.so.4
  ln -sf libtiffxx.so.${pkgver} libtiffxx.so.4
}
