# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Dan Ziemba <zman0900@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-libgnutls28
pkgver=3.3.19
pkgrel=1
pkgdesc='A library which provides a secure layer over a reliable transport layer'
arch=('x86_64')
url='http://gnutls.org/'
license=('GPL3' 'LGPL2.1')
depends=('lib32-nettle' 'lib32-p11-kit' 'lib32-zlib')
makedepends=('gcc-multilib' 'lib32-libidn')
source=("ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/gnutls-${pkgver}.tar.xz")
sha256sums=('888d8779b48f21959b33d4d9ad0b546e5ec3dea20abf0d9bb03869d56b1f44cf')

build() {
  cd gnutls-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --with-zlib \
    --without-included-libtasn1 \
    --enable-local-libopts \
    --disable-cxx \
    --disable-guile \
    --disable-hardware-acceleration \
    --disable-openssl-compatibility \
    --disable-static \
    --disable-valgrind-tests
  make
}

package() {
  cd gnutls-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{libgnutls.so,pkgconfig},share}
}

# vim: ts=2 sw=2 et:
