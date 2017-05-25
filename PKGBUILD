# Mantainer: epitron <chris@ill-logic.com>

pkgname=wcc-git
_pkgname=wcc
pkgver=0.0.1.r1.g391ae30
pkgrel=1
pkgdesc="The Witchcraft Compiler Collection"
arch=('i686' 'x86_64')
license=('MIT')
depends=(capstone glibc binutils zlib libelf readline gsl)
makedepends=(git make)
provides=(wcc)
conflicts=(wcc)
source=("git+https://github.com/endrazine/wcc.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}/" install
}
