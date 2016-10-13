# Maintainer: Gina White <ginabytheabay@gmail.com>

pkgname=poltroon
pkgver=0.0.2
pkgrel=3
pkgdesc="An AUR agent for that prioritizes managing batches of packages."
arch=('x86_64' 'i686')
url="https://github.com/ginabythebay/poltroon"
license=('MIT')
depends=('pacman')
makedepends=('go>=1.7 make go-bindata>=3.0.7 libunistring>=0.9.6-2 gcc')
options=('!strip' '!emptydirs')
source=("https://github.com/ginabythebay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5ee3825234c0f6d6daff320a2a49df9490de1e804b50aeea309764f1228b03a5')

_gourl=github.com/ginabythebay/poltroon

build() {
  mkdir -p "$srcdir/go/src/github.com/ginabythebay"
  rm -rf "$srcdir/go/src/$_gourl"  # just in case we run this twice
  mv "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/$_gourl"

  export GOPATH="$srcdir/go"
  cd $srcdir/go/src/${_gourl}/

  make

  $GOPATH/bin/$pkgname --licenses > ALL_LICENSES
}

package() {
  install -Dm 755 "$srcdir/go/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/go/src/${_gourl}/ALL_LICENSES" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


