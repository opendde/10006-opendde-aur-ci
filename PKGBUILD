# Maintainer: Meir Kriheli <mkriheli@gmail.com>

pkgname=python-whichcraft
_pkgname=whichcraft
pkgver=0.4.0
pkgrel=1
pkgdesc="Cross-platform cross-python shutil.which functionality"
arch=('any')
url="https://github.com/pydanny/whichcraft"
license=('BSD')
groups=('devel')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/pydanny/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('f35a3aa2df24536c453e27131182b49d')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
