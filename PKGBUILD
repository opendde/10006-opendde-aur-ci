# Maintainer: Tomás Duarte <tomas@mustachedsquid.com>
_pkgname=pacman-zfs-hook
pkgname=${_pkgname}-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman ZFS Hook to create ZFS Snapshots on Pacman transactions."
arch=('x86_64')
url="https://git.sr.ht/~mustachedsquid/pacman-zfs-hook"
license=('BSD')
depends=('bash' 'pacman')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${$pkgname}"
	make DESTDIR="$pkgdir/" install
}
