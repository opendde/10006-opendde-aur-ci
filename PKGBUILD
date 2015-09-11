# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=0.1.2
pkgrel=1
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/Cyan4973/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
source=("https://github.com/Cyan4973/zstd/archive/zstd-${pkgver}.tar.gz")
noextract=()
sha1sums=('b730d6c35af1674aa5d5ae6550a4f8912cb33615')

build() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    LDFLAGS='-I ../lib' make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

