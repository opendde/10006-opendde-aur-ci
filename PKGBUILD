# Maintainer: Xiaodong Qi <qxd@bupt.edu.cn>
pkgname=yage
pkgver=0.1.0.20151024.1417.5a0fecd
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
_gitbuild='5a0fecd9aeb9b1f4efcf2fb3ea06c3e00bec9f3c'
source=("https://github.com/yet-another-graphics-engine/YaGE/archive/$_gitbuild.zip")
noextract=()
md5sums=('5068f0c20c221c34afee5e20b3fb0b98')

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
