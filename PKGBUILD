# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zydis
pkgname=$_pkgname-git
pkgver=3.1.0.r132.gab535b1
pkgrel=1
pkgdesc='Fast and lightweight x86/x86-64 disassembler library'
arch=('x86_64')
url='https://zydis.re/'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'git' 'ninja' 'zycore-c>=1.0.0.r19')
provides=("$_pkgname=$pkgver" 'libZydis.so')
conflicts=("$_pkgname")
source=("git+https://github.com/zyantific/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZYDIS_BUILD_SHARED_LIB=ON \
		-DZYDIS_FEATURE_AVX512=OFF \
		-DZYDIS_FEATURE_KNC=OFF \
		-DZYDIS_SYSTEM_ZYCORE=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libZycore.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
