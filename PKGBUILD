# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Alex Gentilucci <alexander.gentilucci@gmail.com>

pkgname=ft2-clone
pkgver=1.33
pkgrel=2
pkgdesc="portable Fasttracker II clone written in C"
arch=('x86_64')
url="https://16-bits.org/ft2.php"
license=("BSD")
makedepends=("libicns")
depends=("alsa-lib" "sdl2")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/8bitbubsy/ft2-clone/archive/v${pkgver}.tar.gz"
        "ft2-clone.desktop")
sha256sums=('8f06aad6c1c722ef6ad17245fc97b692625542c8cfbe7592ca5f93b531b7b904'
            '930fc87987840f878a926e6017fc60a2e58f1676f4d2d6cf9e24d14afb8d3552')


prepare() {
  cd "$pkgname-$pkgver"
  icns2png -x "release/macos/ft2-clone-macos.app/Contents/Resources/ft2-clone-macos.icns"
  chmod +x "make-linux.sh"
}

build() {
  cd "$pkgname-$pkgver"
  ./make-linux.sh
}

package() {
  install -D -m 755 "$pkgname-$pkgver/release/other/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "ft2-clone.desktop" "$pkgdir/usr/share/applications/ft2-clone.desktop"
  install -Dm644 "$pkgname-$pkgver/ft2-clone-macos_256x256x32.png" "$pkgdir/usr/share/pixmaps/ft2-clone.png"
}
