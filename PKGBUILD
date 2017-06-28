# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname=canto-curses
pkgver=0.9.8
pkgrel=1
pkgdesc="ncurses user interface for canto-daemon"
url="http://codezen.org/canto-ng/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('ncurses' 'readline' 'canto-daemon>=0.9.2')
optdepends=('xdg-utils: xdg-open is used as default browser')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/themoken/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('b612707bc0727f031a031ffea60dd8af')


build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}  --optimize=1 --skip-build
}
