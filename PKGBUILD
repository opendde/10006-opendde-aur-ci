# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=jasper
pkgver=1.900.1
pkgrel=3
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard"
arch=('i686' 'x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('libjpeg>=7' 'glut' 'libxi' 'libxmu' 'mesa')
makedepends=('unzip')
options=('!libtool')
source=(http://www.ece.uvic.ca/~mdadams/${pkgname}/software/${pkgname}-${pkgver}.zip)
md5sums=('a342b2b4495b3e1394e161eb5d85d754')
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-shared || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
