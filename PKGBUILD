# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-foggy-round
pkgname=$_pkgname-git
pkgver=0.6
pkgrel=1
pkgdesc="Foggy-Round theme for Plank"
arch=('any')
url='https://www.gnome-look.org/p/1201603/'
license=('GPL3')
depends=('plank')
makedepends=('git')
source=("$pkgname::git+https://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/foggy-round
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/foggy-round/
}
