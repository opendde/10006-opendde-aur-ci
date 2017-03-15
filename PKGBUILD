# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=cropgui
arch=('i686' 'x86_64')
pkgver=0.1.1
pkgrel=6
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="http://emergent.unpythonic.net/01235516977"
depends=('libjpeg' 'tk' 'python2-imaging')
source=("http://media.unpythonic.net/emergent-files/01248401946/cropgui_${pkgver}.tar.gz"
	pil_imports.patch)
md5sums=('b2919654044ba8b0552c308c4909b95f'
         'cd53bf7d255b4b94d3cc9956b8b9ff4e')

prepare() {
cd $srcdir/$pkgname
patch -Np1 -i $srcdir/pil_imports.patch
}

build() {
sed -i '1s/python/python2/' $srcdir/cropgui/*.py
sed -i 's%/usr/bin/cropgui%/usr/share/cropgui/cropgui.py%' $srcdir/cropgui/cropgui.desktop
}

package() {
cd $srcdir/$pkgname
mkdir -p $pkgdir/usr/share/cropgui
install -D -m755 $srcdir/cropgui/*.py $pkgdir/usr/share/cropgui/
install -D -m644 $srcdir/cropgui/cropgui.glade* $pkgdir/usr/share/cropgui/
install -D -m644 cropgui.desktop $pkgdir/usr/share/applications/cropgui.desktop
install -D -m644 cropgui.png $pkgdir/usr/share/pixmaps/cropgui.png
}
