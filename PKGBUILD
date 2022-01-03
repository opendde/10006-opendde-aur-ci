# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-wrapper')
pkgver=0.1.1
pkgrel=1
pkgdesc="Wrapper to display a script output or a text file content on the desktop in sway or other wlroots-based compositors"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-wrapper"
license=('MIT')
depends=('python' 'python-gobject' 'python-i3ipc' 'gtk3' 'gtk-layer-shell')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('wlr-randr: for non-sway Wayland WMs support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/"$pkgname"/archive/v"$pkgver".tar.gz")

md5sums=('7744483a0644ba13ea58cf977ecf78a6')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
