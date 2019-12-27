# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=stylelint-config-standard
pkgver=19.0.0
pkgrel=1
pkgdesc='The standard shareable config for stylelint'
arch=('any')
url="https://github.com/stylelint/$pkgname"
license=('MIT')
depends=()
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('640c3e96238dbf7fe1196a499d951eb6022c44bbb149b6cfdb35cb8d3d377e1b')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # For some odd reason, npm makes some directories world writeable D:
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Install license in the usual place
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
