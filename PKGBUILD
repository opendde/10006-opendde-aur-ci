# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Maribu <leonidas200@web.de>

pkgname=lib32-gdbm
pkgver=1.17
pkgrel=1
pkgdesc='GNU database library'
arch=('x86_64')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL')
depends=('gdbm' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('gcc-multilib')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
options=('!makeflags')
sha256sums=('c8a18bc6259da0c3eefefb018f8aa298fddc6f86c6fc0f0dec73270896ab512f')

build() {
  cd gdbm-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-libgdbm-compat
  make
}

package() {
  cd gdbm-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,share,include}
}

# vim: ts=2 sw=2 et:
