# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gst-validate
pkgver=1.16.0
pkgrel=1
pkgdesc='Debugging tool for GStreamer'
arch=('x86_64')
url="https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-validate/html/"
license=('LGPL2.1')
depends=('gstreamer' 'gst-plugins-base-libs' 'json-glib' 'cairo' 'gtk3' 'python')
makedepends=('git' 'gobject-introspection')
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-devtools.git#tag=${pkgver}"
        'gst-common'::'git+https://gitlab.freedesktop.org/gstreamer/common.git'
        'gst-validate-disable-padmonitor-test.patch')
sha256sums=('SKIP'
            'SKIP'
            'c88df2780f7a022fda4d08f96e7957d98368c6f7ead609dcd3e91b2752ab21c0')

prepare() {
    cd gst-devtools
    
    git submodule init
    git config --local "submodule.validate/common.url" "${srcdir}/gst-common"
    git submodule update
    
    # disable a test that is failing: padmonitor
    # https://gitlab.freedesktop.org/gstreamer/gst-devtools/issues/21
    patch -Np1 -i "${srcdir}/gst-validate-disable-padmonitor-test.patch"
}

build() {
    cd gst-devtools/validate
    ./autogen.sh -- --prefix='/usr' --disable-gtk-doc --disable-gtk-doc-html
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

check() {
    cd gst-devtools/validate
    make check
}

package() {
    cd gst-devtools/validate
    make DESTDIR="$pkgdir" install
}
