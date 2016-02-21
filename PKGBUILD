# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: E Nikulenkov <enikulenkov -- gmail>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Markus Unterwaditzer <markus@unterwaditzer.net>
# Maintainer: Hexchain Tong <i@hexchain.org>

pkgname=coursera-dl-git
_gitname=${pkgname/-git/}
pkgver=0.5.2.r0.g38f190a
pkgrel=1
pkgdesc="Script for downloading Coursera.org videos and naming them"
arch=('any')
url="https://github.com/coursera-dl/coursera-dl/"
license=('LGPL3')
depends=('python' 'python-pyasn1' 'python-beautifulsoup4' 'python-distribute' 'python-requests' 'python-six')
makedepends=('git')
provides=('coursera-dl')
conflicts=('coursera-dl')
source=("git://github.com/coursera-dl/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
  cd "$srcdir/$_gitname"
  python ./setup.py install -O1 --root="$pkgdir"
  install -Dm755 coursera-dl "$pkgdir/usr/bin/coursera-dl"
}

# vim: set ts=2 sw=2 et:
