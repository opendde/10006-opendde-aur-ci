#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=qtcreator-doxygen
pkgver=0.4.6
pkgrel=1
pkgdesc="Doxygen Plugin for Qt Creator"
url=https://github.com/fpoussin/qtcreator-doxygen
arch=(x86_64)
depends=()
license=(MIT)
_qtver=4.4.x

md5sums=('a84fcd8bb999611246520ff183f73f4f')

source=("https://github.com/fpoussin/qtcreator-doxygen/releases/download/v$pkgver/libDoxygen-$pkgver-qtc$_qtver-x86_64.so")


package() {
    mkdir -p "${pkgdir}/usr/lib/qtcreator/plugins/"
    cp libDoxygen-$pkgver-qtc$_qtver-x86_64.so "${pkgdir}/usr/lib/qtcreator/plugins/"
}
