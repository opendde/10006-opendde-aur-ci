# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=genwan-font
pkgname=ttf-${_pkgname%-font}-git
pkgver=v1.501
pkgrel=1
pkgdesc="Free font derived from Source Han Serif."
arch=('any')
license=('OFL')
url="https://github.com/ButTaiwan/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" ttc/*.ttc

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}
