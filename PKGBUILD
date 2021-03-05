# Maintainer: sohlk <sohlk at outlook dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=eleventy
pkgver=0.11.1
pkgrel=1
pkgdesc="A simpler static site generator. An alternative to Jekyll. Transforms a directory of templates (of varying types) into HTML"
arch=('any')
url='https://www.11ty.dev'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/11ty/eleventy/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('da3b11bf638982822befcde468da16a3fe0db2c86ca00ac61b09504976e4a6af')

package() {
  npm install -g --production --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  chown -R root:root "${pkgdir}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/lib/node_modules/@11ty/eleventy/LICENSE"
}
