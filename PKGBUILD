# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=2.34
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
sha1sums_i686=('3c5944ab6ca37b8e75a65896f2dab7b27ce91e0d')
sha1sums_x86_64=('c4812e89a25c3e8cc814c0f5ef6bf2875d9f33b2')

package() {
  cd "$srcdir/$pkgname-${pkgver}-1.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
