# Maintainer: hfte@posteo.org
pkgname=sws
pkgver=2.11.0.0
pkgrel=2
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="http://www.sws-extension.org/"
license=('MIT')
depends=('reaper-bin>=5.979')
makedepends=('git' 'gcc' 'make' 'cmake' 'php' 'php-gd' 'perl')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git://github.com/reaper-oss/sws.git"
	"http://hosting121501.a2fb8.netcup.net/reaper_plugin_functions.tar.xz")
sha256sums=('SKIP'
            '970466a2b357ee8ed998c9a63fd183f158d6869acbf00c803a27b0f1f178f1d0')

pkgver() {
	head -1 $srcdir/$pkgname/version.h.in | tr , . | cut -d' ' -f3
}

prepare() {
    cp "$srcdir/reaper_plugin_functions.h" "$srcdir/$pkgname/vendor"
    cd "$srcdir/$pkgname"
	git submodule update --init
}


build() {
	cd "$srcdir/$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}


package() {
	mkdir -p "${pkgdir}/opt/REAPER/UserPlugins/"
	cp "${srcdir}/$pkgname/build/reaper_sws-x86_64.so" "${pkgdir}/opt/REAPER/UserPlugins/"
	cp "${srcdir}/$pkgname/build/sws_python64.py" "${pkgdir}/opt/REAPER/UserPlugins/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp "${srcdir}/$pkgname/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
