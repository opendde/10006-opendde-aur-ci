# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
#
# This PKGBUILD was generated by `cargo aur`: https://crates.io/crates/cargo-aur

pkgname=falion-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast, asynchronous tool for getting and reading various programming resources."
url="https://github.com/Obscurely/falion"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("falion")
conflicts=("falion")
source=("https://github.com/Obscurely/falion/releases/download/v$pkgver/falion-$pkgver-x86_64.tar.gz")
sha256sums=("f3e568a0c8c2eb78b0c6798196936d00c47a89b515dd5531caaf3eb3a4731e41")

package() {
    install -Dm755 falion -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
