# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fcft
pkgver=2.4.0  # Don’t forget to update CHANGELOG.md
pkgrel=1
pkgdesc="Simple library for font loading and glyph rasterization using FontConfig, FreeType and pixman."
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
depends=('freetype2' 'fontconfig' 'pixman' 'harfbuzz')
makedepends=('meson' 'ninja' 'scdoc' 'tllist')
checkdepends=('check' 'ttf-dejavu')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('ba17a8c6af1d6a25c3d87aa96c1754896e255af71b70cd60a119200e5844fc43')

build() {
  cd ${pkgname}

  meson --prefix=/usr --buildtype=release -Dtext-shaping=enabled . build
  ninja -C build
}

check() {
  cd ${pkgname}
  ninja -C build test
}

package() {
  cd ${pkgname}
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 unicode/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.unicode"
}
