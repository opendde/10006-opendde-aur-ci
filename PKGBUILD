# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gimp-plugin-scale-layer-to-image-size
pkgver=1.4
pkgrel=1
pkgdesc="Scales the contents of the layer, or layer group, to image size."
arch=('any')
url="http://some-gimp-plugins.com/contents/en/extensions/001/"
license=('GPL')
depends=('gimp')
source=("http://some-gimp-plugins.com/contents/en/extensions/001/${pkgname/gimp-plugin-/}.zip")
sha256sums=('d95f2d257cd72f82886709125f856f5e8c60a5c615bc596578d35b3c78a68054')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
