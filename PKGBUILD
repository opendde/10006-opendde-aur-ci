# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=wikicurses-git
pkgver=0f23f6b
pkgrel=1
pkgdesc="A simple curses interface for accessing Wikipedia."
arch=('any')
url="https://github.com/ids1024/wikicurses"
license=('mit')
depends=('python' 'python-urwid')
source=('git://github.com/ids1024/wikicurses.git')
md5sums=('SKIP')
_gitname="wikicurses"

pkgver () {
  cd $srcdir/$_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
