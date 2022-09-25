# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=materialx
_pkgver_major=1.38
_pkgver_minor=5
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=1
pkgdesc="Open standard for representing rich material and look-development content in computer graphics"
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends+=('python')
provides=('materialx')
source=(git+"https://github.com/AcademySoftwareFoundation/MaterialX.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare () {
  cd MaterialX

  git submodule update --init --recursive
}

build() {
  mkdir -p build
  cd build

  cmake $srcdir/MaterialX \
  -DMATERIALX_BUILD_PYTHON=ON\
  -DMATERIALX_BUILD_VIEWER=ON

  cmake --build . --target install -- -j
}

package() {
  mkdir -p "${pkgdir}/usr/bin"

  cd "$srcdir"

  mv build/installed ${pkgdir}/usr/materialx

  ln -s /usr/materialx/bin/MaterialXView ${pkgdir}/usr/bin/mtlxview
}
