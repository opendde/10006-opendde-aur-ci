# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.1.4
_pkgdir=cpeditor-full-source-$pkgver
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPLv3+')
depends=('qt5-base')
makedepends=("cmake" "git" "gcc")
conflicts=("cpeditor-git")
source=("https://github.com/cpeditor/$pkgname/releases/download/$pkgver/cpeditor-full-source-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd $_pkgdir
	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=g++
	cmake --build build
}

package() {
	cd $_pkgdir/build
	make DESTDIR="$pkgdir" install
}



