# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=naikari-git
_pkgname=naikari
pkgver=v0.4.0.r45.ge4b8443ec
pkgrel=1
pkgdesc="A 2-D space trading and mercenary game. Development branch."
arch=('x86_64')
url="https://naikari.github.io/"
license=('GPL3')
depends=('sdl2_image' 'libxml2' 'freetype2' 'libpng' 'openal' 'libvorbis' 'libgl' 'luajit' 'suitesparse')
makedepends=('meson' 'ninja')
provides=('naikari')
conflicts=('naikari')
source=('git+https://github.com/naikari/naikari.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --exclude=nightly | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/$_pkgname"
	meson build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR=$pkgdir meson install -C build
}
