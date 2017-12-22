# Maintainer: petRUShka <petrushkin@yandex.ru>
# CO-Maintainer: Laramy Black <laramy2020@gmail.com>

pkgname=diorite
pkgver=4.9.0
pkgrel=1
pkgdesc="Diorite Library is a utility and widget library for Nuvola Player project based on GLib, GIO and GTK."
arch=("any")
url="https://github.com/tiliado/diorite"
license=('custom:BSD')
depends=('python' 'vala' 'glib2' 'ruby-gio2' 'gtk3' 'sqlite' 'gobject-introspection')
optdepends=('valadoc:        A documentation tool for vala')
makedepends=('scour')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('91b4772e9d188a7afe4f427bcdc33080017d2d79d3fad5fc3349a84204b0f113')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf configure --prefix=/usr --libdir=/usr/lib --novaladoc
    ./waf build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf install --destdir=${pkgdir}
}
