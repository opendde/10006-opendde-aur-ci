# Maintainer : Yamada hayao <hayao@fascode.net>
# Contributer: nsz32 <nszabo2 at gmail dot com>

_pkgname=xfce4-docklike-plugin
pkgname="${_pkgname}-ng-git"
pkgver=v0.3.0.r50.gf11a6ab
pkgrel=1
pkgdesc='A modern, docklike, minimalist taskbar for XFCE (Forked version)'
arch=('i686' 'x86_64')
url="https://github.com/davekeogh/${_pkgname}"
#url='https://github.com/Hayao0819/${_pkgname}'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo' 'glib2')
makedepends=('git' 'xfce4-dev-tools' 'intltool')

conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}")

source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
