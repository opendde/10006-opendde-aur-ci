# Maintainer:  Yigit Dallilar <yigit.dallilar at gmail dot com>

pkgname=ds9
pkgver=8.2
pkgrel=2
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('x86_64')
license=('GPL2')
provides=(ds9)
conflicts=(ds9-bin)
depends=()
options=(!strip)
makedepends=(libx11 libxml2 libxslt libpng tcl zip)
conflicts=()
replaces=()
backup=()
source=("https://github.com/SAOImageDS9/SAOImageDS9/archive/v${pkgver}.tar.gz"
        "ds9.desktop"
        "ds9.png"
        "fix_bool.patch")
md5sums=('24805b1e78b8a78e55c62dd3f83c8a0d'
         'f1738e4ec665ae9afd1b65b86e6a07f1'
         '9297d5738f5f462831075c483dc785d5'
         'e7b894e7791036a1b1d049a11a55ae44')

prepare() {
    cd ${srcdir}/SAOImageDS9-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/fix_bool.patch"
}

build() {
    cd ${srcdir}/SAOImageDS9-${pkgver}
    unix/configure
    make
}

package() {
    
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    cd ${srcdir}/SAOImageDS9-${pkgver}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 bin/ds9 ${pkgdir}/usr/bin/${pkgname}

}

# vim:set ts=4 sw=4 et:

