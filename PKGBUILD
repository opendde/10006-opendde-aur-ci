# Maintainer: kageru <kageru[at]encode[dot]moe>

_plug=adaptivegrain
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.2.0.20.gcf9280a
pkgrel=1
pkgdesc='Reimplementation of the adaptive grain mask as a Vapoursynth plugin'
arch=('x86_64')
url='https://git.kageru.moe/kageru/adaptivegrain'
license=('MIT')
depends=('vapoursynth')
makedepends=('git' 'rustup')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("$_plug::git+https://git.kageru.moe/kageru/adaptivegrain.git")
sha256sums=('SKIP')

pkgver() {
    cd $_plug
    echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_plug
    cargo build --release --locked
}

package() {
    cd $_plug
    install -Dm755 "target/release/libadaptivegrain_rs.so" "$pkgdir/usr/lib/vapoursynth/libadaptivegrain.so"
}
