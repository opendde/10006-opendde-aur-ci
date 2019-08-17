# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=9.12
pkgrel=1
pkgdesc="A translucent theme for Plasma 5."
arch=('any')
url="https://www.opendesktop.org/p/998869/"
license=('custom:Creative Commons')
depends=('plasma-workspace')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=('Helium.tar.gz')
md5sums=('669e61126a5fad06cc4cc130682645cf')

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme/"

  cp -r --no-preserve=mode,ownership "${srcdir}/Helium" "${pkgdir}/usr/share/plasma/desktoptheme"
}
