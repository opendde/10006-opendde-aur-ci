# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python2-advancedhtmlparser' 'python2-advancedhtmlparser-tools')
pkgver=7.2.1
pkgrel=1
pkgdesc="Fast Indexed python2 HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
optdepends=('python2-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=("74e5e48fdbb378f37c9d4634c2ed0e6079fffc73efc48b890536958a721dd0aaabb62580f321611aab2695c8a2aaf99b5a12b07c4b0e9a3b22892d802e3856d4")

build() {
  cd "$srcdir"/AdvancedHTMLParser-$pkgver
  python2 setup.py build
}

package_python2-advancedhtmlparser() {
  cd AdvancedHTMLParser-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove tools from lib package
  rm -Rf "$pkgdir/usr/bin"
}
package_python2-advancedhtmlparser-tools() {
  depends=('python2-advancedhtmlparser')
  conflicts=('python-advancedhtmlparser-tools')
  optdepends=()
  cd AdvancedHTMLParser-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove lib from tools package
  rm -Rf "${pkgdir}/usr/lib"
}
