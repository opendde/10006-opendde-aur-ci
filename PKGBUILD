# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=fluid
pkgver=0.9.0
pkgrel=1
pkgdesc="Components for Qt Quick applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('MPL2')
depends=('qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('extra-cmake-modules')
conflicts=('fluid-git')
groups=('liri')
source=("https://github.com/lirios/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1e198730a855ab8662c4ebb4f13bf5b9b142ddac9971f101acfbfd68a98cd554')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
