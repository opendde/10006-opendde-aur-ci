# Maintainer: Dylan <dylan@flickmag.net>

pkgname='flickmagnet'
_gitname='flickmagnet'
pkgver='0.0.5'
pkgrel=2
pkgdesc='HTTP server similar to Netflix and PopcornTime which streams public domain videos from torrent files.'
arch=('any')
url='https://github.com/acerix/flickmagnet'
license=('MIT')

depends=(
    'python-xdg'
    'python-daemonocle'
    'python-libtorrent-rasterbar'
    'python-pytoml'
    'python-cherrypy'
    'python-mako'
    'python-requests'
    'python-beautifulsoup4'
)

install=flickmagnet.install
source=(
    "$url/archive/$pkgver.tar.gz"
    flickmagnet.install
)
sha256sums=(
    '02d21988cdb6cdfe30b3f9279651d1af6a5d7776cc7fc731b42c09a8d3c83fcd'
    '98073fd66df8193034c4354be85c31df46028a3be410736d82d2e6e851364ef1'
)

build() {
    cd "$_gitname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -dm700 "$pkgdir/srv/$pkgname"
    install -Dm644 "$pkgname/examples/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

