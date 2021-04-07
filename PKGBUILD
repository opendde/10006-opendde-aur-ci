# Maintainer: Microeinstein <mu ddoott emc2 ddoott flower at inventati ddoott org>
# Contributor: Florian Freund <florian 88 freund aatt gmail ddoott ccoomm>
# Contributor: Mark Coolen <mark ddoott coolen aatt gmail ddoott ccoomm nniiccee!>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname="xournalpp-xdg-portal"

pkgver=1.0.20.hotfix.r1.gaef5056c
pkgrel=1
pkgdesc='Xournal++ is a handwriting Notetaking software with PDF annotation support. Supports Pen input like Wacom Tablets.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Microeinstein/xournalpp-xdg-portal"
license=('GPL2')
makedepends=('git' 'cmake' 'cppunit')
depends=('texlive-bin' 'gtk3' 'poppler-glib' 'libxml2' 'portaudio' 'libsndfile' 'lua' 'libzip')
optdepends=('xdg-desktop-portal' 'xdg-desktop-portal-kde')
conflicts=('xournalpp')
install="xournalpp.install"
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}/${pkgname}/build"
}

build() {
	if [ -z "$XDG_CONFIG_HOME" ]; then
		configdir=".config"
	else
		configdir="$(realpath --relative-to="$HOME" "$XDG_CONFIG_HOME")"
	fi
	cd "${srcdir}/${pkgname}/build"

	cmake -DCMAKE_INSTALL_PREFIX="/usr/" -DDEV_CONFIG_DIR="$configdir/xournalpp" -DENABLE_CPPUNIT=ON ..
        cmake --build . --target pot
        cmake --build . --target translations
	cmake --build .
}

check() {
	cd "${srcdir}/${pkgname}/build"

	cmake --build . --target test
}

package() {
	cd "${srcdir}/${pkgname}/build"

	make DESTDIR="${pkgdir}/" install
}
