# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=1.4.9
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip' 'qt5-base' 'p7zip')
optdepends=('qt5-svg' 'qt5-svg')

source=('https://fman.io/updates/arch/fman-1.4.9.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('f96895aeed864bfa55fff0a2efcfd52d2a1932d1fd3d6a07db097f6037f30ab1')

package() {
	tar xf "${srcdir}/fman-1.4.9.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
