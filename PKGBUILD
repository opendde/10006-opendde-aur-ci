# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=bdf-unifont
pkgver=14.0.04
pkgrel=1
pkgdesc="GNU Unifont Glyphs"
arch=('any')
license=('custom' 'GPL2')
url="https://ftp.gnu.org/gnu/unifont"
source=("${url}/unifont-${pkgver}/unifont-${pkgver}.bdf.gz"{,.sig} "LICENSE")
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>
sha512sums=('bdfb131aa67d59d604047311d6774ae33fbe67272f84a4e9fb96ccb7c9e84712c0b2ed20a051c34d69ad86988ce482626427e2eed27efa7576abf5ccf84d971a'
  'SKIP'
  '064e7c0afe836d48610fcdd5d2d080c2583be0f2b70e565440d743072f41a242aec29a500df7a2bd39f423089c291250eabe0cefae5d000aecd7f27a052ee242')

package() {
  gzip -d --force "$srcdir"/unifont-${pkgver}.bdf.gz
  install -Dm644 "${srcdir}/unifont-${pkgver}.bdf" \
    "${pkgdir}/usr/share/fonts/misc/unifont.bdf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
