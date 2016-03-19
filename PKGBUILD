# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

_npmname=generator-karma
_npmver=2.0.0
pkgname=nodejs-generator-karma
pkgver=2.0.0
pkgrel=1
pkgdesc="Yeoman generator for Karma"
arch=(any)
url="https://github.com/yeoman/generator-karma"
license=(BSD)
depends=('nodejs-yeoman')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(194f400caa970539d43dabb3c5425d96fb4343ad)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}

# vim:set ts=2 sw=2 et:
