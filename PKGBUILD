# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=fluid
pkgver=0.6.90.20160327
pkgrel=1
pkgdesc="Components for Qt Quick applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('LGPL')
depends=('qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('extra-cmake-modules')
conflicts=('fluid-git')
groups=('hawaii')
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/0154e772a7a1356940030a87148ee21e0add8e8e")
sha1sums=('a2530fa35e41353018b9bc00568667b8a483a670')

prepare() {
	mkdir -p build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-fluid-0154e77 \
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
