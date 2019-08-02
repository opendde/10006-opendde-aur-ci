# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xreader-git
_pkgbasename=xreader
pkgver=master.lmde.3.r1.g1b4de23
pkgrel=1
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'djvulibre' 'desktop-file-utils' 'xapps-git'
    'gsettings-desktop-schemas' 'gtk3' 'libsecret' 'libspectre' 'webkit2gtk')
makedepends=('git' 'mate-common' 'yelp-tools' 'gobject-introspection')
optdepends=('nemo: nemo extension'
    'caja: caja extension'
    'gtk3-print-backends: printer support in gtk3 apps'
    'texlive-bin: support for dvi files')
provides=($pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xreader'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    if [ -d /usr/include/nemo/libnemo-extension ]; then NEMO_EXT_FLAG=""; else NEMO_EXT_FLAG="--disable-nemo"; fi
    if [ -d /usr/include/caja/libcaja-extension ]; then CAJA_EXT_FLAG=""; else CAJA_EXT_FLAG="--disable-caja"; fi

    cd ${srcdir}/${pkgname}
    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}" \
        --enable-introspection \
        "$NEMO_EXT_FLAG" "$CAJA_EXT_FLAG"
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}
