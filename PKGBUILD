# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=easywifi-git
pkgver=r7.a124e4a
pkgrel=1
pkgdesc="The easiest way to add wifi networks on Linux"
arch=('any')
url="https://github.com/NoahCristino/easywifi"
license=('MIT')
depends=('python' 'networkmanager')
makedepends=('git')
optdepends=('dnsmasq: to create hotspots')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/NoahCristino/easywifi.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Add shebang
	sed -i '1 i\#!/usr/bin/env python' "${pkgname%-git}.py"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
