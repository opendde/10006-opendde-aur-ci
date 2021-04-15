# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=0.6.9
pkgrel=1
pkgdesc="A system information fetcher, with an emphasis on performance and minimalism."

arch=('x86_64')
url="https://github.com/Macchina-CLI/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'git')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('0923bdc46dc5491aa3693b69e3c0cb3d17be5201ae349c2bc8cde1814606a629')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	targetdir=${CARGO_TARGET_DIR:-target}
	install -Dm755 "$targetdir/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
