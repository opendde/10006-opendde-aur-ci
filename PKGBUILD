# Maintainer: Phil Ruffwind <rf@rufflewind.com>
# Contributor: Jonas Platte <aur@jonasplatte.de>
pkgname=purescript-bin
pkgver=0.11.7
pkgrel=2
pkgdesc="A strongly-typed functional programming language that compiles to JavaScript"
arch=(x86_64)
url=http://www.purescript.org
license=(BSD)
depends=(gmp ncurses5-compat-libs zlib)
provides=(purescript)
conflicts=(purescript)
source=(purescript-v$pkgver-linux64.tar.gz::https://github.com/purescript/purescript/releases/download/v$pkgver/linux64.tar.gz)
sha1sums=('f01eb69aa71f5f97c6980f8c68d107480c68ee64')

package() {
    cd "$srcdir/purescript/$f"
    find . -type f -perm -a=x -print0 | while read -r -d '' f; do
        install -Dm755 "$f" "$pkgdir/usr/bin/$f"
    done
    install -Dm644 "$srcdir/purescript/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
