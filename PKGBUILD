# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-panel')
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK3-based panel for sway window manager"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-panel"
license=('MIT')
depends=('python' 'python-gobject' 'python-i3ipc' 'python-netifaces' 'python-pyalsa' 'gtk3' 'gtk-layer-shell' 'wlr-randr' 'light' 'alsa-utils' 'upower' 'playerctl')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('bluez: for Bluetooth status'
            'bluez-utils: for Bluetooth status'
            'wlr-randr: for non-sway window managers support')
source=("https://github.com/nwg-piotr/nwg-panel/archive/v"$pkgver".tar.gz")

md5sums=('60ece58e9be52bb8f98af131b5aac08b')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-panel.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-panel-config.desktop
}
