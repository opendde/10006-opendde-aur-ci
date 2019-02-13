# Maintainer: Andreas Schulz <andi.schulz@me.com>>
# Contributor: Niels Abspoel <aboe76@gmail.com>

pkgname=python-poyo
_pkgname=poyo
pkgver=0.4.2
pkgrel=2
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
sha256sums=('c34a5413191210ed564640510e9c4a4ba3b698746d6b454d46eb5bfb30edcd1d')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
