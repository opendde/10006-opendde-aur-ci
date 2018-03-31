# Maintainer: E5ten

pkgname=yadshot
pkgver=0.1.91
pkgrel=2
pkgdesc="yadshot provides a GUI frontend for taking screenshots using imagemagick/slop and uploads files and pastes to teknik.io "
arch=('x86_64')
url='http://www.simonizor.net'
license=('GPL')
depends=('slop' 'imagemagick' 'yad' 'xclip' 'curl')
source=("https://github.com/simoniz0r/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")
md5sums=('5ba860c4bb45ec9157f85ff2534d318c')

prepare() {
    cd $srcdir
    bsdtar xvf $pkgname-$pkgver-$CARCH.tar.gz
}

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -r "$srcdir/$pkgname/" "$pkgdir/opt/"
   	ln -s "/opt/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
