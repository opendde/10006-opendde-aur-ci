# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.7.0
pkgrel=2
pkgdesc='C++ requests library by whoshuu'
arch=('i686' 'x86_64')
url="https://github.com/whoshuu/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/whoshuu/cpr/archive/refs/tags/$pkgver.tar.gz")
md5sums=('649be012d3274d5e88626e090f716000')

prepare() {
	cd "$srcdir/cpr-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCPR_BUILD_TESTS=OFF -DCPR_FORCE_USE_SYSTEM_CURL=ON .
}

build() {
	cd "$srcdir/cpr-$pkgver"
	make
}

package() {
	cd "$srcdir/cpr-$pkgver"

	mkdir -p "$pkgdir/usr/lib"
	cp -r lib/libcpr* "$pkgdir/usr/lib"

	mkdir -p "$pkgdir/usr/include"
	cp -r include/cpr cpr_generated_includes/cpr "$pkgdir/usr/include"
}
