# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=qml-material
pkgname=$_pkgname-git
pkgver=0.1.r46.g9fcdb81
pkgrel=1
pkgdesc="A UI framework for QtQuick implementing Material Design"
arch=("i686" "x86_64")
url="https://github.com/papyros/qml-material"
license=("LGPL")
depends=("qt5-base" "qt5-declarative" "qt5-quickcontrols" "qt5-svg"
         "qt5-graphicaleffects")
makedepends=("git")
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname" "qml-extras" "qml-extras-git" "papyros-shell" "papyros-settings")
source=("$pkgname::git+https://github.com/papyros/qml-material.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	mkdir -p build
	cd build
	qmake "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}

# Additional functions to generate a changelog

changelog() {
    cd "$pkgname"
    git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
    cd "$pkgname"
    git rev-parse HEAD
}
