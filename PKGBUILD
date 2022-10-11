# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
_pkgorg=camunda
_pkgname=$_pkgorg-modeler
pkgname=$_pkgname-bin
pkgver=5.4.1
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN, DMN and Forms based on bpmn.io"
arch=('x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('MIT')
depends=('xdg-utils' 'gtk3' 'nss')
install=$_pkgname.install
source=(
	"https://github.com/$_pkgorg/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64.tar.gz"
	"$_pkgname.install"
	"$_pkgname.sh"
	"xdg_register.patch")
b2sums=('c5bd943d4b5e969a9c3336eeba97f440c37e6bdd44f44e4de653822f05f7207a0641428e2e2fda865091627f58b6b3732af832a1825a7889cd89d8930aae042e'
        '67491c423c4513c78a01c47cffd0e28287a18913fd7c7b39278d0eeba6203432a84f5db221e9d3c2e755b42fa9a5063c246644c07dcaedc0b0c3f0af2777d604'
        'e2d15fa4996ba95fb29fabaafb57efc0bca02d5d073b25bd453e9f72aa4ca7f02ebe4454c711e26559940ca3e24422c2361a900a9b39c9c42e6cb22547a042a2'
        'c9b99a7168ab80fd5142a4c27159307f98398ed654c50bc2ff566e6134fc8401a3fe8efa5906bce4e6053bb3c04ce59f51e7cd1146fbcef3b11919057926d87c')

build() {
	patch -u "$srcdir/$_pkgname-$pkgver-linux-x64/support/xdg_register.sh" -i "$srcdir/xdg_register.patch"
}

package() {
	install -d $pkgdir/opt/$_pkgname
	cp -R $srcdir/$_pkgname-$pkgver-linux-x64/* $pkgdir/opt/$_pkgname
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/opt/$_pkgname/$_pkgname.sh"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
