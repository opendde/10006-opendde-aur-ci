# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='ngs-lang-git'
pkgver=0.2.4.r2.gfe5f135
pkgrel=1
pkgdesc='Next Generation Shell (NGS)'
arch=('x86_64')
url='https://github.com/ngs-lang/ngs'
license=('GPLv3')
makedepends=('cmake' 'git' 'pandoc' 'peg' 'uthash')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=('git+https://github.com/ngs-lang/ngs.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-lang-git}"

  git describe --tags --exclude 'tested' \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'   \
    | sed 's/v//'
}

prepare() {
  cd "${pkgname/-lang-git}"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
}

build() {
  cd "${pkgname/-lang-git}/build"

  make
}

check() {
  cd "${pkgname/-lang-git}/build"

  ctest
}

package() {
  cd "${pkgname/-lang-git}/build"

  make install
}

# vim: ts=2 sw=2 et:
