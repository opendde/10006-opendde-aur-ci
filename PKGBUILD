# Maintainer: Baris Demirdelen <barisdemirdelen at gmail dot com>

pkgname=xow-git
_pkgname=xow
pkgver=7
pkgrel=1
pkgdesc="Linux driver for the Xbox One wireless dongle"
arch=(x86_64)
url=https://github.com/medusalix/xow
license=('GPL2')
depends=(libusb)
makedepends=(git)
source=('git+https://github.com/medusalix/xow')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git rev-list --count HEAD
}

build() {
	cd $srcdir/$_pkgname
	make BUILD=RELEASE
}

package() {
	cd $srcdir/$_pkgname

  _install_path=$pkgdir/usr/bin
  _service_path=$pkgdir/usr/lib/systemd/system/
  mkdir -p {$_install_path, $_service_path}

  install -Dm755 xow $_install_path/xov
  install -Dm755 xow.service $_service_path/xov.service

  echo "If you want to enable and start the service please run:"
  echo "systemctl enable --now xov.service"
}
