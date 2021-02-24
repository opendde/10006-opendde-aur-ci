# Maintainer: Static_Rocket

pkgname=asus-nb-ctrl-git
pkgver=3.0.1.r0.g6f81f86
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asus-nb-ctrl"
license=('Mozilla Public License Version 2.0')
depends=('libusb' 'udev' 'systemd')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
provides=('asus-nb-ctrl')
source=('git+https://gitlab.com/asus-linux/asus-nb-ctrl.git')
md5sums=('SKIP')
_gitdir=${pkgname%"-git"}

pkgver() {
	cd "$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitdir"
	make build
}

package() {
	cd "$_gitdir"
	make DESTDIR="$pkgdir" install
}

