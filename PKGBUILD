# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=dwmblocks-randoragon-git
pkgver=1.0.r76.234d550
pkgrel=1
epoch=
pkgdesc="An intuitive, home-row mouse replacement"
arch=('x86_64')
url="https://github.com/randoragon/dwmblocks"
license=('MIT')
depends=(libx11)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd dwmblocks
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dwmblocks
	make
}

package() {
	cd dwmblocks
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr/bin install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

