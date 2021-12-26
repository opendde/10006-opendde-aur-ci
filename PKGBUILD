#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Archlinux theme pack for XDE"
pkgname=xde-theme-archlinux
pkgver=1.2.5
pkgrel=1
url="http://www.unexicon.com/"
license=('CCPL:by-nc-nd')
arch=('any')
groups=('xde')
makedepends=('git')
depends=('xde-styles')
source=("$pkgname::git://github.com/bbidulock/$pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags|sed 's,[-_],.,g;s,\.g.*$,,'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
