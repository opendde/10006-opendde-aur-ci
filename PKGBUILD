# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=salut
pkgver=0.2.1
pkgrel=1
pkgdesc="An animated mouse centric notification daemon made with snui."
arch=(x86_64)
url="https://gitlab.com/snakedye/salut"
license=(MPL2)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
depends=('libxkbcommon' 'fontconfig')
install=${pkgname}.install
makedepends=(rust)
sha256sums=('95434bd97f91035e91364f215d1ccdaa974b4d55e702556ad15161989bcb54b3')

build() {
  cd "${pkgname}-v${pkgver}"
  cargo build --release
}

check() {
  cd "${pkgname}-v${pkgver}"
  cargo test --release
}

package() {
  install -Dm755 "${pkgname}-v${pkgver}/target/release/salut" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-v${pkgver}/config/config.ini" \
    "${pkgdir}/usr/share/doc/salut/config.ini"
}
