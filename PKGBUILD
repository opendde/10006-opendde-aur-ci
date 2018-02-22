# Maintainer: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
pkgname=siril
pkgver=0.9.8.3
pkgrel=1
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('gtk3' 'fftw' 'cfitsio' 'gsl' 'libconfig' 'opencv')
makedepends=('intltool')
url="https://free-astro.org/index.php/Siril"
optdepends=('libpng: PNG import'
'libjpeg: JPEG import and export'
'libtiff: TIFF import and export'
'libraw: DSLR RAW images import'
'ffms2: films native support as image sequences and import'
)

_pkgname="${pkgname}-${pkgver}"
source=("https://free-astro.org/download/${_pkgname}.tar.bz2")

sha1sums=('e739ba3de1a66e7ea3a6d3de6c652fc528a90d40')

build() {
	cd "${_pkgname}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
	install -v -d ${pkgdir}/usr/share/applications/
	install -v -d ${pkgdir}/usr/share/mime/packages/
	install -v -m 644 platform-specific/linux/org.free-astro.siril.desktop ${pkgdir}/usr/share/applications/
	install -v -m 644 platform-specific/linux/siril.xml ${pkgdir}/usr/share/mime/packages/
}
