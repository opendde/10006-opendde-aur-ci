# Maintainer: Simon Marcher <marchersimon@zohomail.eu>
pkgname=tldr-cpp-git
pkgver=1.2
pkgrel=2
pkgdesc="The all-in-one tldr client for users and contributors"
arch=('any')
url="https://github.com/marchersimon/tldr-cpp.git"
license=('GPL3')
makedepends=(git make gcc curl libzip)
provides=(tldr)
conflicts=(tldr)
replaces=(tldr)
source=("git+$url")
md5sums=('SKIP')

build() {
	cd tldr-cpp
	make
}

package() {
	cd tldr-cpp
	mkdir -p ${pkgdir}/usr/bin
	make DESTDIR="${pkgdir}" install
}
