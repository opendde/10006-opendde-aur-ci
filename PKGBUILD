# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Cosku Bas <cosku.bas@gmail.com>

pkgname=objectively-git
pkgver=r668.7baa846
pkgrel=1
pkgdesc="Ultra-lightweight object oriented framework for GNU C."
arch=('i686' 'x86_64')
url="https://github.com/jdolan/Objectively"
license=('zlib')

makedepends=('git' 'clang' 'autoconf' 'automake' 'check')

source=(git://github.com/jdolan/Objectively)
sha1sums=('SKIP')

pkgver() {
	cd Objectively
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd Objectively
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd Objectively
	make DESTDIR="${pkgdir}" install
}
