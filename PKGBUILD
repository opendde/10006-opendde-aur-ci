# Maintainer: j-james <jj@j-james.me>
# Contributor: Marc Baudoin <babafou@babafou.eu.org> 
pkgname=xminesweeper
_pkgname=xdemineur
pkgver=2.1.1
pkgrel=1
pkgdesc="A minesweeper game for the X Window System"
arch=('i686' 'x86_64')
url="http://www.babafou.eu.org/xdemineur/"
license=('custom')
depends=('libx11' 'libxpm')
makedepends=('imake')
source=('http://www.babafou.eu.org/xdemineur/xdemineur-2.1.1.tar.gz'
        'xdemineur.desktop'
        'xdemineur.xpm')
sha256sums=('593824412a208a1b75d5b15745a271dc3eba330d41f7718f4826567d04bcbb9b'
            '99816f3dc5b22e2cabe1350182399780eab2eff927d076fced44ef2028f5acf7'
            'a3b9b7b073313a2ea457a6dc734ac43826577a57dec403bd3962ca3c348a5809')

build() {
    cd $_pkgname-$pkgver
    xmkmf
    make
}

package() {
    install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 $_pkgname.xpm "$pkgdir/usr/share/pixmaps/$_pkgname.xpm"
    cd $_pkgname-$pkgver
    make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
    make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install.man
}
