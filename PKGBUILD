# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
#
pkgname="python2-gimp"
_pkgname="gimp"
pkgver="2.10.20"
pkgrel="1"
pkgdesc='Python 2 plugins support for GIMP'
url='https://www.gimp.org/'
arch=('x86_64')
license=('LGPL')
depends=('gimp' 'pygtk')
makedepends=('gtk-doc' 'intltool')
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e12f9f874b1a007c4277b60aa81e0b67330be7e6153e5749ead839b902fc7b3c')

prepare() {
    cd ${_pkgname}-${pkgver}
    sed -i 's/^libgimpui = .*/ libgimpui = -lgimpui-2.0/
            s/^libgimpconfig = .*/ libgimpconfig = -lgimpconfig-2.0/
            s/^libgimpwidgets = .*/ libgimpwidgets = -lgimpwidgets-2.0/
            s/^libgimp = .*/ libgimp = -lgimp-2.0/
            s/^libgimpcolor = .*/ libgimpcolor = -lgimpcolor-2.0/
            s/^libgimpbase = .*/ libgimpbase = -lgimpbase-2.0/
            s/^libgimpmath = .*/ libgimpmath = -lgimpmath-2.0/
            s/^libgimpthumb = .*/ libgimpthumb = -lgimpthumb-2.0/' plug-ins/pygimp/Makefile.am
    autoreconf -fi
}

build() {
    cd ${_pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/bin \
        --enable-python

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make -C plug-ins/pygimp
}

package() {
    cd ${_pkgname}-${pkgver}
    make -C plug-ins/pygimp DESTDIR="${pkgdir}" install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
