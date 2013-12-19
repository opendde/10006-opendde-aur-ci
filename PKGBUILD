# Maintainer : Benjamin Chretien <chretien at lirmm dot fr>

pkgname=spacevecalg-git
_name=spacevecalg
pkgver=20131219
pkgver() {
  date +%Y%m%d
}
pkgrel=1
pkgdesc="Implementation of spatial vector algebra with the Eigen 3 linear algebra library."
arch=('i686' 'x86_64')
url="https://github.com/jorisv/SpaceVecAlg"
license=('GPLv3')
depends=('eigen3' 'python2')
makedepends=('doxygen' 'cmake' 'git' 'pkg-config' 'boost')
provides=('spacevecalg')
source=("${_name}::git+https://github.com/jorisv/SpaceVecAlg")
md5sums=('SKIP')

build()
{
  cd "${srcdir}/${_name}"
  git submodule init
  git submodule update

  mkdir -p ${srcdir}/build && cd ${srcdir}/build

  cmake "${srcdir}/${_name}" -DCMAKE_INSTALL_PREFIX="/usr" \
                             -DCMAKE_BUILD_TYPE="Release"
  make
}

check()
{
  cd ${srcdir}/build
  make test
}

package()
{
  cd ${srcdir}/build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
