# Maintainer: Meir Kriheli <mkriheli@gmail.com>

pkgname=python-whichcraft
_pkgname=whichcraft
pkgver=0.5.1
pkgrel=1
pkgdesc="Cross-platform cross-python shutil.which functionality"
arch=('any')
url="https://github.com/pydanny/whichcraft"
license=('BSD')
groups=('devel')
depends=('python' 'python-setuptools')
makedepends=('python' 'python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/pydanny/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8e74e0e269222ec74462343ac1eea3b7')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
