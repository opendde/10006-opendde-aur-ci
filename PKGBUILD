# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term
pkgver=1.8.6
pkgrel=2
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term-hooky' 'ttf-iosevka-term-zshaped')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/02.iosevka-term-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE")
sha256sums=('33bb655260e926204b376903d240abf350bdbf1fa5143935371a30a647c21667'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
