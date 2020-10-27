# Maintainer: Ohio2 (Maksymilian Sęk) <sekmartyna4@gmail.com>
# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch-ohio2"
pkgver=r157.7cb4cbb
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
optdepends=('bc: memory percent')
url="https://github.com/ThatOneCalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/Ohio2/NerdFetch")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd NerdFetch
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd NerdFetch
}

package() {
	install -Dm755 "$srcdir"/NerdFetch/nerdfetch "$pkgdir/usr/bin/nerdfetch-ohio2"
	install -Dm644 "$srcdir"/NerdFetch/README.md "$pkgdir/usr/share/doc/$pkgname"
}
