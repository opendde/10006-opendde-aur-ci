# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=lyx-git
_pkgname=lyx
pkgver=2.2.0.r467.ge57889f
pkgrel=1
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
arch=('i686' 'x86_64')
url="http://www.lyx.org"
license=('GPL')
depends=(qt5-svg qt5-base python imagemagick enchant boost-libs libmythes file)
makedepends=(glibc qt5-base git autoconf automake gcc)
optdepends=(texlive-core rcs texlive-latexextra)
provides=('lyx-git')
conflicts=('lyx lyx-git')
replaces=('lyx lyx-git')
source=(git://git.lyx.org/lyx.git#branch=master)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh && ./configure --prefix=/usr 
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
