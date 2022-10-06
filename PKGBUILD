# Maintainer: Tor Berge torberge@outlook.com

pkgname=speki
pkgver=0.1.2
pkgrel=1
pkgdesc="Flashcard app for your terminal"
url="https://github.com/TBS1996/speki"
license=("GPL-2.0-only")
arch=("x86_64")
provides=("speki")
conflicts=("speki")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
#sha256sums=("543245b01741ecff65cf1828f03b09737d5d5df8a7fec2dfd72608f7f779afed")


prepare() {
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm755 speki -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
