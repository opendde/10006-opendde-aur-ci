pkgname=cangaroo
pkgver=0.2.0.r0.g1e47cbe
pkgrel=1
pkgdesc="An Open-Source CAN Monitor"
arch=('any')
license=('GPL')
depends=(
  'git'
  'qt5-base'
)
url="https://github.com/HubertD/cangaroo"

source=("$pkgname::git+https://github.com/HubertD/cangaroo.git#tag=$pkgver")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd "$srcdir/$pkgname"
	# master is the normal one. msgfilter is the current
	qmake
	make
}


package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$srcdir/$pkgname/bin/cangaroo" "$pkgdir/usr/bin/cangaroo"
	install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname/src/assets/cangaroo.png" "$pkgdir/usr/share/pixmaps/cangaroo.png"
}