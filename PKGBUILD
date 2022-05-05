# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=websocat-git
pkgver=1.9.0.r6.g7c95eb7
pkgrel=1
pkgdesc="Command-line client for WebSockets"
arch=(x86_64)
url="https://github.com/vi/websocat"
license=(MIT)
makedepends=(git rust)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "${srcdir}/${pkgname}"

	cargo build --release --locked --features=ssl
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "target/release/websocat" "${pkgdir}/usr/bin/websocat"
}
