# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cmake-doc-qch
pkgver=3.8.1
pkgrel=1
pkgdesc="CMake documentation in Qt Help format"
arch=('any')
license=('CCPL:cc-by')
url='http://www.cmake.org/documentation/'
# rename to include version of each release
# (prevents accidentally using the file of an older version)
source=("CMake-$pkgver.qch::https://www.cmake.org/cmake/help/v${pkgver:0:3}/CMake.qch")
md5sums=('983d67a8423b0c20c05e9244b45793b0')

package() {
  mkdir -p "$pkgdir/usr/share/doc/qt"
  cp "$srcdir"/CMake-$pkgver.qch "$pkgdir/usr/share/doc/qt"
}
