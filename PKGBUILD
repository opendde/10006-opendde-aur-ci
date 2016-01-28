# Maintainer: Jonathan Reams <jbreams@mongodb.com>
pkgname=mongo-cxx-driver
pkgver=r3.0.0
pkgrel=1
pkgdesc="The official MongoDB C++ driver library"
arch=('i686' 'x86_64')
url="http://docs.mongodb.org/ecosystem/drivers/cpp/"
license=('Apache')
groups=()
depends=("libmongoc" "boost-libs")
makedepends=("cmake" "boost")
source=("https://github.com/mongodb/mongo-cxx-driver/archive/$pkgver.tar.gz")

prepare() {
	cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr
}

build() {
	cd "$pkgname-$pkgver/build"
    echo $pkgdir
    DESTDIR=$pkgdir cmake -DCMAKE_BUILD_TYPE=Release .. -DCMAKE_INSTALL_PREFIX=/usr -DBSONCXX_POLY_USE_MNMLSTC=No -DBSONCXX_POLY_USE_BOOST=Yes
    DESTDIR=$pkgdir make -j$(grep -c proc /proc/cpuinfo)
}

package() {
	cd "$pkgname-$pkgver/build"
    DESTDIR=$pkgdir make install
}
md5sums=('0d32fc5ae76bdf2ff387ab1c40c93fe0')
