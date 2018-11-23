# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>
pkgname=optimus-manager
pkgver=0.3
pkgrel=2
pkgdesc="Management utility to handle GPU switching for Optimus laptops."
arch=('any')
url="https://github.com/Askannz/optimus-manager"
license=('MIT')
depends=('python' 'python-setuptools' 'bbswitch' 'xorg-xrandr')
makedepends=('python-setuptools')
source=("git+https://github.com/Askannz/optimus-manager.git#tag=v$pkgver")
sha256sums=('SKIP')
 
build() {
 
  cd "${srcdir}/optimus-manager/"
  python setup.py build
 
}
 
 
package() {
 
  cd "${srcdir}/optimus-manager/"
 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 modules/optimus-manager.conf "$pkgdir/etc/modprobe.d/optimus-manager.conf"
  install -Dm755 xorg/optimus-manager_Xsetup "$pkgdir/usr/bin/optimus-manager_Xsetup"
  install -Dm644 systemd/optimus-manager.service "$pkgdir/usr/lib/systemd/system/optimus-manager.service"
  install -Dm644 systemd/99-optimus-manager.conf "$pkgdir/usr/lib/systemd/system/display-manager.service.d/99-optimus-manager.conf"
  install -Dm644 optimus-manager.conf "$pkgdir/usr/share/optimus-manager.conf"
  
  mkdir -p "$pkgdir/var/lib/optimus-manager/"
 
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
 
} 
