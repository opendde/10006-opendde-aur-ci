# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Salim Perchy <yamil-salim.perchy@inria.fr>

pkgname=icesl
pkgver=2.1.11
pkgrel=1
pkgdesc="A GPU accelerated modeler and slicer for 3D printing"
arch=('x86_64')
url="http://shapeforge.loria.fr/icesl/"
license=('custom')
depends=('qt4' 'freeglut' 'glu' 'libpng' 'zlib' 'freetype2' 'libxext' 'perl')
source=(https://gforge.inria.fr/frs/download.php/file/37338/${pkgname}${pkgver}-amd64.deb)
sha512sums=('602f0a87414a91b9d71ec7b361d04d745b3a8415d2eef1dc59f479c69026ff287e8b6cfdb68c8cfbd0f83b2a650f503f4f53e41ba0016ead4489424ec383df75')

package() {
	bsdtar -xf control.tar.gz ./copyright
	install -Dm644 $srcdir/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
	bsdtar -xf $srcdir/data.tar.xz -C $pkgdir
	ln -s /usr/share/$pkgname/bin/IceSL-slicer $pkgdir/usr/bin/$pkgname
}
