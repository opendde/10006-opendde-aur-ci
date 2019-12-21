# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wofi
pkgver=1.0
pkgrel=2
pkgdesc="Rofi-like wlroots launcher"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/wofi"
license=('GPL3')
depends=('wayland' 'gtk3')
makedepends=('meson')
source=("${pkgname}-v${pkgver}.tar.gz::https://hg.sr.ht/~scoopta/wofi/archive/v${pkgver}.tar.gz")
# We have to SKIP the validity check to avoid an issue with hg.sr.ht:
# https://todo.sr.ht/~sircmpwn/hg.sr.ht/33
sha256sums=('SKIP')

build() {
    cd "${pkgname}-v${pkgver}"
    meson build
    ninja -C build
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${pkgname}-v${pkgver}/build/wofi" "$pkgdir/usr/bin/"
}
