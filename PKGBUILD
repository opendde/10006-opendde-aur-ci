# Maintainer: Niels Abspoel <aboe76@gmail.com>
# Contributor:

pkgname=python-poyo
_pkgname=poyo
pkgver=0.1.0
pkgrel=1
pkgdesc="A YAML Parser for Python"
arch=(any)
url="https://github.com/hackebrot/poyo"
license=('MIT')
groups=('devel')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=('https://pypi.python.org/packages/source/p/poyo/poyo-0.1.0.tar.gz')
md5sums=(2dfde0f2d1898bb91b2a78435efa1713)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
