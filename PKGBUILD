# Maintainer: Aphosis <aphosis.github@gmail.com>
pkgname=gmux
pkgver=0.1.2
pkgrel=1
pkgdesc="Manage multiple git repositories with ease."
url="https://github.com/Aphosis/gmux"
license=("MIT")
arch=("x86_64")
source=(https://github.com/Aphosis/${pkgname}/archive/${pkgver}.tar.gz)
makedepends=("cargo")
provides=("gmux")

build() {
    export CARGO_TARGET_DIR="${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    export CARGO_TARGET_DIR="${srcdir}/${pkgname}-${pkgver}"
    cd ..
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    cargo install --path . --root "$usrdir"
    rm -f $usrdir/.crates.toml
}

