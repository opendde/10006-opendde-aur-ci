# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=redditgtk-git
pkgver=r52.82127b4
pkgrel=1
epoch=
pkgdesc="Reddit gtk client"
arch=('any')
url="https://gitlab.gnome.org/GabMus/redditgtk"
license=('GPL3')
groups=()
depends=(
	'gtksourceview4'
	'libhandy1'
	'python-dateutil'
	'python-flask'
	'python-gobject'
	'python-mistune'
	'python-praw'
)
makedepends=('meson' 'git' 'gobject-introspection')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build() {
	arch-meson "$pkgname" build

	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
