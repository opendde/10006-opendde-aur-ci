# Maintainer: Xiaodong Qi <qxd@bupt.edu.cn>
pkgname=yage
pkgver=0.1.0.20150805.2225.91becb1
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
_gitbuild='91becb114aa75c5fe725eacf8c87deb5d4476e59'
source=("https://github.com/yet-another-graphics-engine/YaGE/archive/$_gitbuild.zip")
noextract=()
md5sums=('69fb9854fac4c4f755dc1f1201aeed6e')

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
