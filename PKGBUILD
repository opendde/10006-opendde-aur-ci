# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xed
pkgver=1.4.4
pkgrel=1
pkgdesc="A small and lightweight text editor. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview3' 'enchant' 'desktop-file-utils' 'libsm'
        'libpeas')
makedepends=('gnome-common' 'iso-codes' 'gobject-introspection')
provides=($_pkgname)
conflicts=('xed-git' $_pkgname)
url='https://github.com/linuxmint/xed'
install=xed.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6f1640737ebe4c4b4146d4ddb61d11cc')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --with-gtk=3.0 --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/xed"
    make CFLAGS='-w -O2'
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

