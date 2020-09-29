# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Monospaced bitmap font from Raize Software'
pkgname=otb-raize
pkgver=1.0
pkgrel=1
url=http://web.archive.org/web/20180627152019/http://www.raize.com/DevTools/Tools/RzFont.asp
arch=(any)
license=(as-is)
makedepends=(fonttosfnt)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tecate/bitmap-fonts/raw/master/archives/raize.tar.gz")
sha512sums=(1fd22873fb7309ac526eccf9811a31a522c3294558a8a4a077e67fcf2854f1658fce9250db0761dee7c409dc7d2b0ed66c08938202f8e64895202964259541c7)

build () {
	fonttosfnt -o raize-normal.otb -- raize-normal-*.pcf.gz
	fonttosfnt -o raize-bold.otb -- raize-bold-*.pcf.gz
}

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/OTB" *.otb
}
