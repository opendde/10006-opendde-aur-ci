# Maintainer: Qther <dtaclanlegion@gmail.com>
_pkgname=parui
pkgname=${_pkgname}-git
pkgver=0.1.14.r0.e79f9bb
pkgrel=3
pkgdesc="Simple TUI frontend for paru."
arch=('x86_64')
url="https://github.com/Vonr/parui"
license=('MIT')
depends=('glibc' 'git' 'pacman' 'gcc-libs')
makedepends=('cargo')
optdepends=('paru: default AUR interface'
            'yay: alternative AUR interface')
source=('git+https://github.com/Vonr/parui')
md5sums=('SKIP')

prepare() {
    cd "$srcdir/${_pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "${_pkgname}"
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
