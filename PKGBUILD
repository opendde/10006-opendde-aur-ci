# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz [at] gmail [dot] com>

pkgname=bootstrap
pkgver=4.6.0
pkgrel=1
pkgdesc="Front-end framework for web development"
arch=('any')
url="https://getbootstrap.com/"
license=('MIT')
optdepends=('jquery>=3.5.1: for JavaScript plugin support')
install=bootstrap.install
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip"
	"LICENSE")
sha256sums=('0a211451ad260ab512a7e5c2a1636cf29949c615876590fe2be5012520eed423'
            '9b2ce2d9793f14f0fb1a77ce64961acc1157fb25858156c47139491107970acb')

package() {
  cd ${pkgname}-${pkgver}-dist
  install -d ${pkgdir}/usr/share/javascript/${pkgname}/{css,js}
  for _jsfile in ./js/*; do
	install -m0644 "${_jsfile}" "${pkgdir}/usr/share/javascript/${pkgname}/js/"
  done
  for _cssfile in ./css/*; do
	install -m0644 "${_cssfile}" "${pkgdir}/usr/share/javascript/${pkgname}/css/"
  done
  install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
