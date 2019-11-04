# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.9.1
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'jq' 'netcat')
checkdepends=('shellcheck')
optdepends=('testssl.sh')
source=("$url/archive/$pkgver/twa-$pkgver.tar.gz")
sha512sums=('ddf0ccdfbf729dcbc152b79bdfa5f92f196266d13ff06215e8b4e421e9cff1bceadc22551d3d4eb28ba932f24deb8febd8bd46225315b141830a64a3ebbfcc78')

check() {
  cd twa-$pkgver
  ./util/test
}

package() {
  cd twa-$pkgver
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}

# vim:set ts=2 sw=2 et:
