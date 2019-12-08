# Maintainer: Andreas Schulz <andi.schulz@me.com>>
# Contributor: Niels Abspoel <aboe76@gmail.com>

pkgname=python-poyo
_pkgname=poyo
pkgver=0.5.0
pkgrel=1
pkgdesc="A YAML Parser for Python"
arch=(any)
url="https://github.com/hackebrot/poyo"
license=('MIT')
groups=('devel')
depends=('python' 'python-setuptools')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e26956aa780c45f011ca9886f044590e2d8fd8b61db7b1c1cf4e0869f48ed4dd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
