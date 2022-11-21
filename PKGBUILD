# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python38-ipdb
pkgver=0.13.9
pkgrel=3
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
arch=("any")
license=("BSD")
depends=('python38-ipython')
makedepends=('python38-setuptools' 'python38-toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('9a100901442e5d32c131790c549e0bc13748ac5894af6ffc202ea5bffd7f63993bab64259e7ece5c7fdf4c16d8d69785639bf6c63945190ff21752cb482c4a4e')

build() {
  cd ipdb-$pkgver
  python3.8 setup.py build
}

check() {
  cd ipdb-$pkgver
  python3.8 setup.py test
}

package() {
  cd ipdb-$pkgver
  python3.8 setup.py install -O1 --root="$pkgdir"
  ln -s ipdb3 "$pkgdir"/usr/bin/ipdb
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}
