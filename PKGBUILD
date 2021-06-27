# Maintainer: Thulinma
# Maintainer: jjacky
pkgname=kalu
pkgver=4.4.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="https://github.com/Thulinma/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.0' 'pacman<6.1' 'curl' 'libnotify' 'notification-daemon')
makedepends=('perl' 'groff')
source=(https://github.com/Thulinma/kalu/archive/refs/tags/$pkgver.tar.gz)
install=kalu.install
md5sums=('d33dffb2dc4b43c5b2dad234768d2692')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}

