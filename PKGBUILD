# Maintainer: database64128 <free122448@hotmail.com>
pkgname=uvw
pkgver=2.12.1_libuv_v1.44
pkgrel=1
pkgdesc="Header-only, event based, tiny and easy to use libuv wrapper in modern C++"
arch=(x86_64)
url="https://github.com/skypjack/uvw"
license=('MIT')
depends=('libuv')
makedepends=('cmake')
source=("https://github.com/skypjack/uvw/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6a7d82d51ea2894f1f8040c75222f3bf27b8b95869984cdece0c84c2f8c23aabfdc1ac82212d131120226df598d818fd31d31e1489c056a19e382dabf76f0c83')

build() {
    cmake -S "$pkgname-$pkgver" -B build -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCH_LIBUV=OFF \
        -DUSE_LIBCPP=OFF
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/uvw/LICENSE"
}
