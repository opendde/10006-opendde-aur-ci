# Maintainer: grufo <madmurphy333@gmail.com>

_extname='nautilus-launch'
pkgname="${_extname}-git"
pkgver='r1.1f8f86d'
pkgrel=1
pkgdesc='A simple Nautilus extension that allows to run executables and launchers via right-click menu'
arch=('i686' 'x86_64')
url='https://github.com/madmurphy/nautilus-launch'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
makedepends=('intltool')
conflicts=("${_extname}" "${_extname}-bin")
source=("git+https://github.com/madmurphy/${_extname}.git")
md5sums=('SKIP')

pkgver() {

	cd "${_extname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_extname}"
	./bootstrap --noconfigure

}

build() {

	cd "${srcdir}/${_extname}"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${_extname}"
	make DESTDIR="${pkgdir}" install

}

