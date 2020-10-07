# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=tasmotizer-git
_pkgname=tasmotizer
pkgver=r43.a2d048f
pkgrel=1
pkgdesc="The full-featured flashing tool for Tasmota. With the great ESPtool from Espressif under the hood, and all required settings by default."
arch=('any')
url="https://github.com/tasmota/$_pkgname"
license=('GPL3')
depends=(
    'python-pyqt5'
    'python-pyserial'
    'qt5-serialport'
)
makedepends=(
    'git'
    'python-setuptools'
)
provides=('tasmotizer')
conflicts=('tasmotizer')
source=(
    "git+$url.git"
    "$_pkgname.desktop"
)
sha256sums=(
    'SKIP'
    '0ae53010ef85803ba6815c7e6b449ce43051edb7b7fd94402a5d9b8aaea50a18'
)

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    python setup.py install --root="$pkgdir" --optimize=1
    
    mv $pkgdir/usr/bin/"$_pkgname".py $pkgdir/usr/bin/"$_pkgname"
    
    install -Dm644 "../$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
