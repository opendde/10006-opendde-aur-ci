# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
pkgname=wrk
pkgver=4.0.1
pkgrel=1
pkgdesc="Modern HTTP benchmarking tool"
arch=(i686 x86_64)
url=https://github.com/wg/wrk
license=(Apache)
depends=()
makedepends=()
source=(https://github.com/wg/$pkgname/archive/$pkgver.tar.gz)
md5sums=(2520c55f197b5bb38b96ef2495b9af11)
options=('!makeflags'
         '!buildflags')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 wrk "$pkgdir/usr/bin/wrk"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/wrk/LICENSE
  install -Dm644 NOTICE "$pkgdir"/usr/share/licenses/wrk/NOTICE
  install -d -m755 "$pkgdir"/usr/share/doc/wrk/examples/
  install -Dm644 README "$pkgdir"/usr/share/doc/wrk/README
  install -Dm644 SCRIPTING "$pkgdir"/usr/share/doc/wrk/SCRIPTING
  install -Dm644 CHANGES "$pkgdir"/usr/share/doc/wrk/CHANGES
  install -Dm644 scripts/*.lua "$pkgdir"/usr/share/doc/wrk/examples/
}

# vim:set ts=2 sw=2 et:

