# Maintainer: Jan Koppe <post@jankoppe.de>

pkgname=yarn
pkgver=0.17.0
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management.'
arch=(any)
url='http://yarnpkg.com'
license=('BSD')
depends=('nodejs')
source=("https://github.com/yarnpkg/yarn/releases/download/v$pkgver/yarn-v$pkgver.tar.gz")
sha256sums=('bb87332c23baec5680e13c9afa858d851276eca27e33e215a84338fb4acb0026')

package() {
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R "$srcdir"/dist/* "$pkgdir"/usr/lib/node_modules/yarn

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarn

  install -Dm644 "$srcdir"/dist/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
