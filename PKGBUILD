# Maintainer: Prasad Kumar
pkgname=telinkrin-icon-theme
pkgver=2.1
pkgrel=6
pkgdesc="A matching icon theme for Telinkrin-GTK theme based on Adwaita and MySuru"
arch=('any')
url='https://www.opendesktop.org/p/1215199/'
license=('CC BY-NC-SA')
depends=('hicolor-icon-theme')
provides=('telinkrin-icon-theme')
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/prasadkumar013/AUR/master/Sources%2BBinaries/Sources/Arrongin_Telinkrin/Telinkrin-SURU-$pkgver.tar.xz")
sha512sums=('bf62126e1405efebd00565afc46114501a8356d0c481a3ab6a6bb00da90d3a1fa0be5ca89355ccf5d4c9cd42c6e3e2b59cf0d899af79bc71ab36eee7e3b8fcff')
package() {
  cd "${srcdir}"/Telinkrin-SURU-$pkgver
  install -d "$pkgdir"/usr/share/icons/Telinkrin
  cp -rf * "$pkgdir"/usr/share/icons/Telinkrin
}
