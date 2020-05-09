#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons-git
_pkgname=xde-icons
pkgver=1.5.r1.gcdf7695
pkgrel=1
arch=('any')
license=(CCPL:by-sa)
url="http://github.com/bbidulock/xde-icons"
groups=('xde')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}" 'ayatana-indicator-session')
depends=('hicolor-icon-theme' 'mist-icon-theme')
makedepends=('librsvg' 'git')
source=("$pkgname::git://github.com/bbidulock/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
  ./configure
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/icons/hicolor/32x32/apps/arch-logo.png"
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-logo.svg"
  rm -f "$pkgdir/usr/share/pixmaps/arch-logo.svg"
}

# vim: et sw=2:
