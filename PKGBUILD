# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=libpng12-git
pkgver=1.2.59
pkgrel=1
pkgdesc='A collection of routines used to create PNG format graphics files'
arch=('x86_64')
url='http://www.libpng.org/pub/png/libpng.html'
license=('custom')
depends=('glibc' 'zlib')
provides=(libpng12)
conflicts=(libpng12)
source=(git://git.code.sf.net/p/libpng/code#branch=libpng12
        "https://sourceforge.net/projects/libpng-apng/files/libpng12/${pkgver}/libpng-${pkgver}-apng.patch.gz")
#validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F') # Glenn Randers-Pehrson
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd libpng
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libpng

  patch -Np1 -i ../libpng-${pkgver}-apng.patch

  libtoolize --force --copy
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd libpng

  ./autogen.sh
  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd libpng

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include/*.h,lib/{libpng.{a,so},pkgconfig},share}

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/libpng12/
}

# vim: ts=2 sw=2 et:
