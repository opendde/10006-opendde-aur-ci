# Maintainer: vonpupp <>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Contributor: Albert De La Fuente Vigliotti <>

pkgname=xiphos
pkgver=4.2.0
pkgrel=2
pkgdesc='A Bible study tool for GTK3'
arch=('x86_64' 'i686')
url='http://xiphos.org'
license=('GPL2')
depends=('dbus-glib'
         'gtkhtml4'
         'libbiblesync.so'
         'minizip'
         'sword'
         'webkit2gtk')
makedepends=('appstream-glib'
             'cmake'
             'docbook-utils'
             'gnome-common'
             'gnome-doc-utils'
             'gtkmm'
             'intltool'
             'libffi'
             'libxml2'
             'python'
             'zlib'
             'zip')
provides=('gnomesword')
conflicts=("${provides[@]}")
replaces=("${provides[@]}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/crosswire/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6f4734747c9dd0de27b672c4720ff1613f3937d88fbc0fe8a0b77d8ee562a8fa')

prepare() {
    cd "$pkgname-$pkgver"
    # TODO: Remove after upstream source package released (not the git archive)
    echo $pkgver > cmake/source_version.txt
}

build() {
    cd "$pkgname-$pkgver"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGTKHTML=ON
    make -C build
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
