pkgname=8bitdo-ultimate-controller-udev
pkgver=1.0
pkgrel=1
pkgdesc='udev rules for 8bitdo controller 2.4GHz mode'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libevdev' 'xboxdrv' 'systemd' 'udev')
install="install"
source=('file://99-8bitdo-ultimate-controllers.rules'
        'file://8bitdo-ultimate-dinput@.service'
        'file://8bitdo-ultimate-xinput@.service')
sha256sums=('25b2fd49c1c60068f1b9d7607b63e1942442691ba5014d4c0fa96b198bb616ca'
            'c9b8f6853518baa14fcddb8b021dd643142e8ea8f94443c625257272f6b5a66d'
            'a0fe329b4f86af73b594055150fecce1f2c55c48b7d5adeb1c4d287a3e866df5')

package() {
  # install udev rules
  install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
  cp "$srcdir"/*.rules "$pkgdir/usr/lib/udev/rules.d/"

  # install systemd services
  install -dm 755 "${pkgdir}/usr/lib/systemd/system"
  cp "$srcdir"/*.service "$pkgdir/usr/lib/systemd/system"
}
