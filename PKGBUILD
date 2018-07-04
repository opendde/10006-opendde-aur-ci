# Maintainer: Roy Oursler <roy.j.oursler@intel.com>
pkgname=isa-l
pkgver=2.23.0
pkgrel=1
pkgdesc="A collection of optimized low-level functions targeting storage applications"
arch=(x86_64)
url="https://github.com/01org/$pkgname"
license=('BSD')
makedepends=('nasm')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('5c83e80666a9fd99ba73d50ab08d12d8bcbc808d')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix="${pkgdir}/usr" -q
    make
}

check() {
    cd "${srcdir}/$pkgname-$pkgver"
    make check
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
