# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=solitude
pkgver=1
pkgrel=1
pkgdesc="Tomes of Solitude, a game"
arch=('x86_64' 'i686')
url="http://softwarebakery.com/maato/tos.html"
license=('unknown')
depends=('sdl')
install=$pkgname.install
source=("http://softwarebakery.com/maato/files/ludumdare/tomes_of_${pkgname}_$pkgver.tar.gz"
        "solitude.sh"
        "solitude.png"
        "solitude.desktop")
sha256sums=('94ccf40b2db120a71c23789f9147606d8103a149b887fc6a2828f6fb15d5a3ae'
            '65864c882d63a57f130d1417a4919f72f1a05a02022d3d8afe779bf7f86120cf'
            'eb6ce37db9ebeb176b38f3912d7b8c43ffd7c40b0c4f90adff83499142d52e09'
            'd57be66a8d25618b31a0e12e41fb8debee52f2be87a0e8d2ad6ad0391a29e2a1')

build() {
  cd "$srcdir/tomes_of_$pkgname"

  cmake -G "Unix Makefiles"
  make
}

package() {
  cd "$srcdir/tomes_of_$pkgname"

  install -Dm755 tos "$pkgdir/usr/bin/$pkgname.elf"
  mkdir -p "$pkgdir/usr/share/solitude"
  cp -r res "$pkgdir/usr/share/solitude/"
  cp -r maps "$pkgdir/usr/share/solitude/"
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd "$srcdir"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/solitude"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
