# Maintainer: Cravix ( dr dot neemous at google dot com )
 
pkgname=seamonkey-i18n-zh-cn
pkgver=2.35
pkgrel=1
_lang=zh-CN
pkgdesc="Simplified Chinese language pack for SeaMonkey"
arch=('any')
license=('MPL')
url="http://www.seamonkey-project.org/"
depends=("seamonkey>=${pkgver}")
source=(http://releases.mozilla.org/pub/mozilla.org/seamonkey/releases/${pkgver}/langpack/seamonkey-${pkgver}.${_lang}.langpack.xpi)
noextract=(seamonkey-${pkgver}.${_lang}.langpack.xpi)

package() {
  install -Dm644 "${srcdir}/seamonkey-${pkgver}.${_lang}.langpack.xpi" \
    "${pkgdir}/usr/lib/seamonkey-${pkgver}/extensions/langpack-${_lang}@seamonkey.mozilla.org.xpi"
}

md5sums=('851c03fa934bd4bc28826fe62b7642c4')
