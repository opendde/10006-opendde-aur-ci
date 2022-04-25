# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dr-Noob <peibolms at gmail dot com>

pkgname=cpufetch
pkgver=1.02
pkgrel=1
pkgdesc="Simple yet fancy CPU architecture fetching tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Dr-Noob/cpufetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-Makefile.patch')
sha256sums=('3d1c80aba3daa5fe300b6de6e06d9030f97b7be5210f8ea4110de733ea4373f8'
            'c9f71ab8ef432d8c808cac86e95ab5ddedc1e8355ccd634b877b908b58953d58')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < 001-Makefile.patch
}

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir/" install
}
