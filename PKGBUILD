# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-gtksourceview4-git
pkgver=r9.ea9f616
pkgrel=1
pkgdesc="Tempus themes for GTK4 syntax highlighting"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL3')
depends=('gtksourceview4')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/gtksourceview-4/styles"
	install -Dm644 *.xml "$pkgdir/usr/share/gtksourceview-4/styles"
}
