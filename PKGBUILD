pkgname=simpleorcapluginsystem
pkgver=1.00
pkgrel=3
pkgdesc="SOPS Provides a simple plugin system for orca include plugins"
arch=(any)
license=('GPL3')
url="https://github.com/chrys87/simple-orca-plugin-system"
#source=("https://github.com/chrys87/simple-orca-plugin-system/archive/$pkgver.tar.gz")
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
depends=('orca' 'yad')
install='simpleorcapluginsystem.install'
provides=('simpleorcapluginsystem')
conflicts=('simpleorcapluginsystem-git')
md5sums=('d2c7d0d6a01c69efffcf4c02bd7d699b')
    
package() {
  cd "${srcdir}//simple-orca-plugin-system-$pkgver"
  mkdir -p "$pkgdir/usr/share/"
  cp -r SOPS "$pkgdir/usr/share/"
}
