# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nodejitsu Inc. <info@nodejitsu.com>
# Contributor: indexzero <charlie.robbins@gmail.com>
# Contributor: mmalecki <me@mmalecki.com>
# Contributor: chjj <chjjeffrey@gmail.com>
# Contributor: V1 <info@3rd-Eden.com>

_npmname=winston
pkgname=nodejs-winston
pkgver=3.3.4
pkgrel=1
pkgdesc="A logger for just about everything."
arch=(any)
url="https://github.com/flatiron/winston"
license=("MIT")
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f9764197c28ff456a3c02bfcdc0b65da0b4d33626762042357994a6cfc928720')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
