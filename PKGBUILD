# Maintainer: Xiaodong Qi <qxd@bupt.edu.cn>
pkgname=yage
pkgver=0.1.0.20150803.1948.1c18e08
pkgrel=1
epoch=0
pkgdesc="Yet another Graphics Engine"
arch=('i686' 'x86_64')
url="https://github.com/yet-another-graphics-engine/YaGE/"
license=('LGPL3')
groups=()
depends=('gtk3' 'gstreamer0.10')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_gitbuild='1c18e08754f94fc0ffc3471a5bbca4ec42a7d33f'
source=("https://github.com/yet-another-graphics-engine/YaGE/archive/$_gitbuild.zip")
noextract=()
md5sums=('8f071ab036057a6e0790d8bf4d2dc56d')

prepare() {
	return 0
}

build() {
	cd YaGE-$_gitbuild
	cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

check() {
	return 0
}

package() {
	cd YaGE-$_gitbuild
	make DESTDIR="$pkgdir/" install
}
