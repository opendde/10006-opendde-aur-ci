# Maintainer: Prasad Kumar
pkgname=arrongin-icon-theme
pkgver=2.1
pkgrel=1
pkgdesc="A matching icon theme for Arrongin-GTK theme based on Adwaita and MySuru"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('hicolor-icon-theme')
provides=('arrongin-icon-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1522367320/s/76c9d4848e73f0e0a2a8bce9e65a3df0/t/1522685535/u/455718/Arrongin-Suru-$pkgver.tar.xz")
sha512sums=('ced07baa78690f370009fb04e83f4e229e5e841de02f163fb72b277e1b3ea4dce7397cde1262649fbd683d2ba54b6807968fe83319f777d1292bb1c9328f4950')
package() {
  cd "${srcdir}"/Arrongin-Suru-$pkgver
  install -d "$pkgdir"/usr/share/icons/Arrongin
  cp -rf * "$pkgdir"/usr/share/icons/Arrongin
}
