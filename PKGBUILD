# Maintainer: robertfoster

pkgname=lib32-vgui
pkgver=f5566261
pkgrel=2
pkgdesc="Half Life 1 SDK"
url="https://github.com/FWGS/vgui-dev"
license=('CUSTOM')
arch=('x86_64')
source=("$pkgname::git+https://github.com/FWGS/vgui-dev")

pkgver() {
        cd $srcdir/$pkgname
	git log | head -n 1 | cut -c 8-15
}

package() {
        cd $srcdir/$pkgname/
        install -Dm755 lib/vgui.so $pkgdir/usr/lib32/vgui.so
	mkdir $pkgdir/usr/include/
        cp -r include "$pkgdir/usr/"
}

md5sums=('SKIP')
