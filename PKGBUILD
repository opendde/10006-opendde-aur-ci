pkgname=gtomb-bin
pkgver=0.8
pkgrel=6
pkgdesc="VPNKS protects you against leaks caused by disconnetction"
arch=('any')
url="https://github.com/plasticbrain/vpnkillswitch"
license=('GPL')
depends=('tomb')
makedepends=('bash')
source=(gtomb
)
sha256sums=('b0eb94d54844621f63398f7e3d0acda55bf6cd1bf41fb9457d5de76d4ef6af8e')
sha384sums=('50904ce741749312f1087eb16af0f55b0ce8049175aaae09e06bab2ca2c09b87537e2204941f54bfee72558d585740de')
sha512sums=('92a577ac258c44239728a82b381932fcdfe55cedad765aa329e104e6a73ab26afaae61437da44d46b5cbbcf78e23fe6641046617a2146a80abefe85151b87f9a')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	chmod +x ${srcdir}/gtomb
	cp ${srcdir}/gtomb ${pkgdir}/usr/bin/gtomb
}

# vim:set ts=2 sw=2 et:
