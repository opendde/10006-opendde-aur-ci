# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=emulsion
pkgver=6.0.0
pkgrel=1
pkgdesc="A fast and minimalistic image viewer"
arch=('i686' 'x86_64')
url="https://github.com/ArturKovacs/emulsion"
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme' 'libxcb')
makedepends=('cmake' 'meson' 'nasm' 'ninja' 'python' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver%.*}.tar.gz"
        "emulsion.desktop")
sha256sums=('2d3a1a40a82b63179f4e3413565f79e99e9ed8a0ab3bac60ec459012ba35e58d'
            'a1bdf607a12a4c9a10e15586c6c90afef6985a3f4bd7c451e7c022c17f986aed')

build() {
    cd $pkgname-${pkgver%.*}
    cargo build --release --locked --features avif
}

check() {
    cd $pkgname-${pkgver%.*}
    cargo test --release --locked --features avif
}

package() {
    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd $pkgname-${pkgver%.*}
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resource_dev/emulsion.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
