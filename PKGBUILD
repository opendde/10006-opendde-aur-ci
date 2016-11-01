# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Petar Koretic <petar.koretic@sartura.hr>

pkgname=libnetconf-git
_pkgname=libnetconf
pkgver=r2227.62a983a
pkgrel=1
pkgdesc='a NETCONF library in C intended for building NETCONF clients and servers.'
url="https://github.com/CESNET/$_pkgname.git"
arch=('i686' 'x86_64')
license=('BSD')
depends=('curl' 'libssh' 'libxslt')
makedepends=('git' 'doxygen')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!emptydirs')
source=("$pkgname::git+https://github.com/CESNET/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i -e '/mode=finish/d;/LDCONFIG/d' Makefile.in
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [[ -d "$pkgdir/var/lib/$_pkgname" ]] && chmod 0755 "$pkgdir/var/lib/$_pkgname"
  rm -fr "$pkgdir/usr/share/$_pkgname/doxygen"
}
