# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=2.24
pkgrel=1
pkgdesc="A simple P2P client that is compatible with the BitTorrent protocol"
arch=('i686' 'x86_64')
url="http://www.tixati.com/"
license=('custom:tixati')
depends=('gtk2' 'hicolor-icon-theme')
optdepends=('gconf: for shell integration')
install=$pkgname.install
source=("LICENSE")
source_i686=("http://tixati.com/download/$pkgname-${pkgver}-1.i686.manualinstall.tar.gz")
source_x86_64=("http://tixati.com/download/$pkgname-${pkgver}-1.x86_64.manualinstall.tar.gz")
sha1sums=('35d7f63a3b0dbf3f8f2bd0a45a7f3c96b453e86b')
sha1sums_i686=('55d8746d1127b813138037716d8d07617c80aeed')
sha1sums_x86_64=('adff29d4023efd4db600d369c9539751cd5afb5f')

package() {
  cd "$srcdir/$pkgname-${pkgver}-1.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
