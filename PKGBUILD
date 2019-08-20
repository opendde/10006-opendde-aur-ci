# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chkrootkit
pkgver=0.53
pkgrel=3
pkgdesc="Locally checks for signs of a rootkit"
arch=('x86_64')
url="http://www.chkrootkit.org/"
license=( 'CUSTOM' )
install=
changelog=
noextract=()
# Is this necessary for ifpromisc?
#depends=('net-tools')
optdepends=('tiger: a wrapper for chkrootkit')
source=("ftp://ftp.pangeia.com.br/pub/seg/pac/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.launcher"
        "${pkgname}-${pkgver}.tar.gz.sig"
	"${pkgname}.launcher.sig")
sha512sums=('f8de19d0a61ccb6ac184ad6642d78041729cba799eedcc8088cb6d2c5cf4de0574c6083caad364576a601265322e61c183b266304f00667527bf29fdc51359c7'
	    'c7a28d6313dc48cc17a0850e2816b9b17a8b0bdf435c3f75fbd4deedf740067de8e58b38d488945561bf9c3ad8bb03adc8e4a5a1da63775bce1afdcf49fd83ba'
	    'SKIP'
            'SKIP')
build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        make sense
}
package() {
	for f in check_wtmpx chkdirs chklastlog chkproc chkrootkit chkutmp chkwtmp ifpromisc strings-static;
	do
        	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/${f} ${pkgdir}/usr/lib/${pkgname}/${f}
	done
        install -D -m755 ${srcdir}/${pkgname}.launcher ${pkgdir}/usr/bin/${pkgname}
        install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYRIGHT ${pkgdir}/${pkgname}/usr/share/licenses/${pkgname}/LICENSE
        for f in ACKNOWLEDGMENTS README;  # sic
	do
        	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/${f} ${pkgdir}/${pkgname}/usr/share/doc/${pkgname}/${f}
	done
}
