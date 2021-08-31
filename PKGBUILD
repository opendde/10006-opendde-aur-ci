# Maintainer: Nico Ramlow <nico@nycode.de>
pkgname=mcserv-git
pkgver=r54.644c37c
pkgrel=1
pkgdesc="CLI utility to manage MC server installations."
arch=('x86_64')
url="https://github.com/DRSchlaubi/mcserv"
license=('GPL3')
makedepends=('git' 'java-runtime' 'dart')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/DRSchlaubi/mcserv')
noextract=()
options=('!strip')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
	dartSdk=$(readlink -f $(which dart))
	echo "dart.sdk=${dartSdk%/bin/dart}" > local.properties
	./gradlew dartPubGet
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./gradlew clean copyReleasePackage
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
	install --mode=755 -D -- $srcdir/${pkgname%-git}/build/package/release/mcserv ${pkgdir}/usr/bin/mcserv
	install --mode=655 -D -- $srcdir/${pkgname%-git}/build/package/release/liblibmcserv.so ${pkgdir}/usr/lib/liblibmcserv.so
}
