# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=generator-mobileangularui
_npmver=1.2.3
pkgname=nodejs-$_npmname
pkgver=1.2.3
pkgrel=1
pkgdesc="Yeoman generator for Mobile Angular UI"
arch=('any')
url="https://github.com/mcasimir/mobile-angular-ui"
license=('BSD')
depends=('nodejs-yeoman' 'nodejs-gulp' 'nodejs-bower' 'nodejs-mocha')

source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('d4a9184f2bfe17022f0841bf2aeae2782da3cf2022ac2cb495c79ae875cc3b95')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_npmver --python=python2
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}

# vim:set ts=2 sw=2 et:

