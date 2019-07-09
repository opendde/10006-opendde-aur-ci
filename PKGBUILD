# Maintainer: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate-git
pkgver=1.4.0.r6.g8e2ce97
pkgrel=2
pkgdesc="A simple and modern GTK eBook reader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://johnfactotum.github.io/foliate/"
license=('GPL-3.0')
depends=('gjs>=1.52.0'  'webkit2gtk' 'gettext')
makedepends=('meson>=0.40' 'ninja')
optdepends=('hyphen: Auto-hyphenation support'
			'hyphen-en: Hyphenation rules for English; you may choose package for your language'
			'dictd: Offline dictionary support')
source=("${pkgname%-git}::git+https://github.com/johnfactotum/${pkgname%-git}.git#branch=master")
provides=("${pkgname%-git}")
replaces=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	meson build --prefix=/usr
	ninja -C build
}

package(){
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
