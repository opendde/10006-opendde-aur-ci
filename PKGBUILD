# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=nodejs-csso
_npmname=csso
pkgver=5.0.3
pkgrel=1
pkgdesc="CSS minifier with structural optimisations"
arch=('any')
url="https://github.com/css/csso"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('a6ee6c6b6c2d09abe59bb5f435ce20156f96fd84043c52d02e20032363689afe')

package() {
  npm install -g --prefix "$pkgdir"/usr --cache "${srcdir}/npm-cache" "$srcdir"/$_npmname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
