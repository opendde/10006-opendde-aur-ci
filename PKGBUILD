# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=pyfetch
pkgver=2020.11.09
pkgrel=1
pkgdesc='neofetch rewritten in python'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GPL3')
depends=('gtk3' 'python-gputil')
source=("${pkgname}-$pkgver-$pkgrel.tar.gz::${url}/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver-$pkgrel"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin"
}
