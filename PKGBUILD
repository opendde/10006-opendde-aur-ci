# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=cloog-git
pkgver=0.18.4
pkgrel=2
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('isl')
source=('cloog-0.18.4::git+http://repo.or.cz/cloog.git#branch=master')
provides=('isl15' 'cloog')
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git submodule init
  git submodule update --recursive
  sh autogen.sh
  ./configure --prefix=/usr --with-isl --with-osl
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # There are certain race conditions on running the tests, so we restrict
  # it to one job (one CPU core).
  make -j1 check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir/ install
}
