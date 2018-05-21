# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

_pkgname=compton-conf
pkgname=${_pkgname}-git
pkgver=0.4.0.0.gc6a6dd0
pkgrel=1
pkgdesc='A graphical configuration tool for Compton X composite manager. Development version.'
arch=('i686' 'x86_64')
url='https://github.com/lxde/compton-conf'
license=('LGPL2.1')

groups=('lxqt')
depends=('qt5-base' 'libconfig')
makedepends=('cmake' 'git' 'qt5-tools' 'lxqt-build-tools-git>=0.5.0')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("git+https://github.com/lxde/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags 2>/dev/null | sed -r 's/-/./g'
}

prepare() {
	# Build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
