# Maintainer: ffqq <shuttara@gmail.com>
pkgname=liteaur
pkgver=1.2
pkgrel=1
pkgdesc="LiteAUR: The shell script light-weight AUR helper"
arch=('i686' 'x86_64')
url="https://gitlab.com/TechSour12/liteaur"
license=('GPL3')
depends=('pacman' 'git')
optdepends=('doas' 'sudo')
provides=(liteaur)
source=("$pkgname::git+https://gitlab.com/TechSour12/liteaur.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "$pkgname"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
