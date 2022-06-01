# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=farpdf-git
pkgver=0.2
pkgrel=1
pkgdesc="A experimental PDF software designed for serious readers."
arch=('i686' 'x86_64')
url="https://gitlab.com/slbtty/far2"
license=('AGPL3')
depends=('libmupdf' 'qt6-base')
makedepends=(git cmake ninja)
conflicts=()
provides=('farpdf')
replaces=()
source=("$pkgname::git+https://gitlab.com/slbtty/far2#tag=v0.2")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
}

build(){
	cd "$srcdir/$pkgname"
	cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build 
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
