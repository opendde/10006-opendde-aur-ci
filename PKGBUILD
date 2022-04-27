# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=citus
pkgver=10.2.5
pkgrel=1
pkgdesc="Scalable PostgreSQL for multi-tenant and real-time workloads"
url="https://github.com/citusdata/citus"
arch=('any')
license=('AGPL-3.0')
depends=('postgresql')
makedepends=('postgresql-libs' git llvm)
install="${pkgname}.install"
source=("https://github.com/citusdata/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"${pkgname}.install")
sha512sums=('95ee1225c850bc986025f6960cb5784b02f2ac5af8f312f5dd4a270c4ebf46dd60388ba604a9cd4cf2e22f8b7a855bd18654cbe9f701ba7cd35c1576414d185f'
            '1ccf8c4a0b1353134ba85dad024d438f4492e88b3139f11db958e0460a925260d8c9cd7eeb8e11b7f8adbc0c4ede4820fdb3a90073b93f699c50d648418789c3')

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=${pkgdir} install
}
