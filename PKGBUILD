# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='QRit'
pkgname="${_pkgname,,}"
pkgver=1.1.2
pkgrel=1
pkgdesc='Create awesome QR codes'
arch=('x86_64')
url='https://github.com/sergius02/QRit'
license=('GPL3')
depends=('granite' 'qrencode')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a7a6694367be2a8b23530b60738a2571a21aad1ea994f4b67e800da8ab6f8a65')

build() {
  arch-meson "${_pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
