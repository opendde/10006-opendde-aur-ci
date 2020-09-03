# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=webapp-manager-git
pkgver=1.0.3.r53.31d233e
pkgrel=1
pkgdesc="Run websites as if they were apps."
arch=('x86_64')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-gobject' 'python-configobj' 'python-setproctitle'
         'python-tldextract' 'python-beautifulsoup4' 'xapps' 'dconf')
makedepends=('git')
optdepends=('brave' 'chromium' 'google-chrome' 'epiphany' 'vivaldi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/webapp-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Fix browser names
	sed -i 's/brave-browser/brave/g' \
		"usr/lib/${pkgname%-git}/common.py"
	sed -i 's/epiphany-browser/epiphany/g' \
		"usr/lib/${pkgname%-git}/common.py"

	# Fix license path
	sed -i 's/common-licenses/licenses\/common/g' \
		"usr/lib/${pkgname%-git}/${pkgname%-git}.py"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cp -r etc usr "$pkgdir"

	# Fix launching Chrome & Vivaldi
	ln -s /usr/bin/google-chrome-stable "$pkgdir/usr/bin/google-chrome"
	ln -s /usr/bin/vivaldi-stable "$pkgdir/usr/bin/vivaldi"
}
