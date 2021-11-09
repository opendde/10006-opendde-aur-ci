# Maintainer: piernov <piernov@piernov.org>

pkgname=flexbv-unstable-bin
pkgver=R1410
pkgrel=1
pkgdesc="FlexBV Professional Boardview (unstable version)"
arch=('x86_64')
url="https://pldaniels.com/flexbv/"
license=('custom')
conflicts=('flexbv-bin' 'flexbv-unstable-bin')
provides=('flexbv-bin')
depends=('sdl2' 'fontconfig' 'sqlite' 'zlib' 'gtk3' 'libpng')
makedepends=()
source=("https://pldaniels.com/flexbv/alpha/FlexBV-$pkgver-linux.tar.gz"
	"flexbv.sh")
md5sums=('8f4fdd337deb5dee27ab6de2861e7f1c'
         'b014cd122766c980f4617496350b5034')

package() {
	install -d -m755 "$pkgdir/opt/flexbv"
	cp -a "FlexBV-$pkgver-linux"/* "$pkgdir/opt/flexbv"
	install -D -m755 flexbv.sh "$pkgdir/usr/bin/flexbv"
	ln -s "/tmp/flexbv.log" "$pkgdir/opt/flexbv/flexbv.log"
}
