# Maintainer: piernov <piernov@piernov.org>

pkgname=pc-ble-driver
pkgver=4.1.2
pkgrel=1
pkgdesc="C/C++ libraries for Bluetooth Low Energy nRF5 SoftDevice serialization."
arch=('x86_64')
url="https://github.com/NordicSemiconductor/pc-ble-driver"
license=('custom')
depends=()
makedepends=('cmake')
options=('staticlibs')
source=("https://github.com/NordicSemiconductor/pc-ble-driver/archive/v${pkgver}.tar.gz"
	"git+https://github.com/Microsoft/vcpkg.git")
md5sums=('4e6add958cdd779b1d9331775c40d682'
         'SKIP')

prepare() {
	cd vcpkg
	 ./bootstrap-vcpkg.sh
	 export VCPKG_ROOT="$(pwd)"
	 export PATH="${VCPKG_ROOT}:${PATH}"

	cd ../"$pkgname-$pkgver"
	mkdir -p build
	cd build
	vcpkg install asio catch2 spdlog
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-G Ninja ..
	cmake --build .
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" ninja install
}
