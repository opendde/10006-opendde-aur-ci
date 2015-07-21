# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
_pkgname=cargo-check
pkgname=$_pkgname-git
pkgver=r7.d582b94
pkgrel=1
pkgdesc=""
arch=('x86' 'x86_64')
url="https://github.com/rsolomo/cargo-check"
license=('BSD')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/rsolomo/cargo-check.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test
}

package() {
    cd "$srcdir/$_pkgname"
    install -D "target/release/cargo-check" "$pkgdir/usr/bin/cargo-check"
    install -D -m 644 "LICENSE" "$pkgdir/usr/share/licences/${_pkgname}/LICENSE"
}
