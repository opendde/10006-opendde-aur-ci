# Maintainer: Quentin Bazin <quent42340 at gmail dot com>

_pkgname=eifl
pkgname="${_pkgname}-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Epitech Intra for Linux"
arch=("i686" "x86_64")
license=("None")
url="https://github.com/Quent42340/EIFL"
depends=("qt5-base" "qtkeychain" "curl")
makedepends=("cmake" "cpr-git")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

build() {
	cd "${_pkgname}"
	cmake .
	cmake --build .
}

package() {
	cmake --build "${_pkgname}" --target install -- DESTDIR="${pkgdir}"
}

