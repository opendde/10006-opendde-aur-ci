# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=c++utilities
_reponame=cpp-utilities
pkgname=$_name-doc
pkgver=4.0.0
pkgrel=1
arch=('any')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities (API documentation)'
license=('GPL')
makedepends=('cmake' 'doxygen' 'dia' 'graphviz')
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('903ac50b3c4104728d077cb851a9f9628c3cfdcba6a20e826b7cbe8debf44083')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make c++utilities_apidoc
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install-api-doc
}
