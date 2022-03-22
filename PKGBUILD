# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=lemon-lime
pkgver=0.3.3
pkgrel=3
epoch=
pkgdesc="为了 OI 比赛而生的基于 Lemon 的轻量评测系统 | A tiny judging environment for OI contest based on Project_LemonPlus"
arch=('x86_64' 'i686')
url="https://github.com/Project-LemonLime/Project_LemonLime"
license=('GPL3')
groups=()
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools' 'cmake' 'ninja')
checkdepends=()
optdepends=('gcc: C and C++ support'
            'fpc: Pascal support'
            'java-environment: Java support'
            'freebasic: BASIC support'
            'python: Python support')
provides=("lemon-lime")
conflicts=("lemon-lime-git")
replaces=()
backup=()
options=(debug strip)
install=
changelog=

source=(
    "https://github.com/Project-LemonLime/Project_LemonLime/releases/download/${pkgver}/Lemon-${pkgver}-source-all.7z"
)
noextract=("Lemon-${pkgver}-source-all.7z")
b2sums=('da967fc7c69a1afc8f8e6f53d15c8070f9243cebd8daa827141c50a254eec8bdc3383abd71c0b3bc99fc3e116e30c4f29ca40f7bec1ccc6cc74d01c76c8977c5')

prepare() {
    cd "$srcdir"
    bsdtar -xvf Lemon-${pkgver}-source-all.7z
}

build() {
	cd "$srcdir"
	cmake -S. -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-GNinja \
		-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DLEMON_BUILD_INFO="Build for Arch Linux" \
		-DLEMON_BUILD_EXTRA_INFO="Build on $(uname -a | cut -d " " -f3,13)" \
		-DEMBED_TRANSLATIONS=OFF \
		-DEMBED_DOCS=OFF
	ninja -C build

}

package() {
	cd "$srcdir"
	ninja -C build install
	install -D -m644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
