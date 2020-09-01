# Maintainer: Jonathon Fernyhough <jonathon_at m2x.dev>

pkgname=pacapt
pkgver=2.4.3
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('any')
url=https://github.com/icy/pacapt
license=(custom)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('ce1ceba4304603030a34348da5eb968b97777c27dc2d1b7cf47237c260f0b8a20991a84c6427a0082724a4239e9f26fae2cd136e1d18a883f9f3d6f204f0fba0')

build() {
	make -C $pkgname-$pkgver VERSION=$pkgver pacapt
}

#check() {
#	make -C $pkgname-$pkgver tests
#}

package() {
	cd $pkgname-$pkgver
	install -D     pacapt  "$pkgdir"/usr/bin/pacapt
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
