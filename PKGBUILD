# Maintainer: Peter Grayson <pete@jpgrayson.net>
# Contributor: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=2.0.0
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="https://stacked-git.github.io/"
license=('GPL2')
arch=(x86_64)
depends=('git')
makedepends=('cargo' 'asciidoc' 'xmlto')
source=(
	"https://github.com/stacked-git/stgit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('b7b6d41aeb3fc509444fcf06aca64ad2d8e538900ad75d826c4a64e660ae8a16')

prepare() {
	cd "${pkgname}-${pkgver}"
	cargo --locked fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=${PWD}/target
	make build doc
	make -C completion all
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=${PWD}/target
	make unit-test
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr DESTDIR=${pkgdir} install-all
	install -D -m 0644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
