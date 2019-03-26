# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-system76-power-git
pkgver=r51.8a5af31
pkgrel=1
pkgdesc="Gnome shell extension for System76 power management"
arch=('any')
url="https://github.com/pop-os/gnome-shell-extension-system76-power"
license=('MIT')
depends=('gnome-shell' 'system76-power')
makedepends=('git' 'make')
source=("${pkgname}::git+https://github.com/pop-os/gnome-shell-extension-system76-power.git"
		"update-metadata-json.patch")
sha256sums=('SKIP'
            '85e5a9c989ae170442f52531ffe0a6ccb5444118aca1919cb3d49e8250295de0')

pkgver() {
	cd ${pkgname}

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${pkgname}

	patch -Np1 -i ../update-metadata-json.patch
}

package() {
	cd ${pkgname}

	make DESTDIR="${pkgdir}" install
}
