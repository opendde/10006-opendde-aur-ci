# Maintainer: hfte@posteo.org
pkgname=sws
pkgver=2.9.4.0
pkgrel=2
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="http://www.sws-extension.org/"
license=('MIT')
depends=('reaper>=5.409')
makedepends=('git' 'gcc' 'make' 'php')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git://github.com/reaper-oss/sws.git"
	"git://github.com/justinfrankel/WDL"
	"https://swsaur.000webhostapp.com/files/reaper_plugin_functions.tar.xz")
sha256sums=('SKIP'
	    'SKIP'
	    'cb035263433a8ae0aaa269702a439e6bb0fc4d756d3d6daaac12af7a01169eb5')

pkgver() {
	cd "$pkgname"
	head -1 version.h | tr , . | cut -d' ' -f3
}

prepare() {
	REAPERVERSION="$(pacman -Q reaper | cut -d' ' -f2 | cut -d'-' -f1)"
	cp "reaper_plugin_functions/$REAPERVERSION/reaper_plugin_functions.h" \
           "$srcdir/$pkgname"
}


build() {
	cd "$srcdir/$pkgname"
	git checkout next
	make
}


package() {
	DESTDIR="${pkgdir}/usr/lib/REAPER/Plugins/"
	mkdir -p "${DESTDIR}"
	cp "${srcdir}/$pkgname/reaper_sws64.so" "${DESTDIR}"
	cd "${srcdir}"
	cd ..
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
