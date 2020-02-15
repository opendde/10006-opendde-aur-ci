# Maintainer: Corey Stephan <corey.stephan@marquette.edu>
pkgname=grb-git
pkgver=r2.2f031ac
pkgrel=1
pkgdesc="Greek Bible (Septuagint & New Testament) in the terminal"
arch=(any)
url="https://github.com/LukeSmithxyz/grb"
license=('custom:Public Domain')
depends=(bash)
source=('grb::git+https://github.com/LukeSmithxyz/grb')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 vul $pkgdir/usr/bin/grb
}
