# Maintainer: fzerorubigd <fzero@rubi.gd>
_pkgmain=backports.csv
pkgname=python-$_pkgmain
pkgver=1.0.7
pkgrel=2
pkgdesc="Backport of Python 3 csv module."
arch=('any')
url="https://github.com/ryanhiebert/backports.csv"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=('python-backports.csv')
options=(!emptydirs)
source=($pkgname-$pkgver.zip::https://github.com/ryanhiebert/backports.csv/archive/${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('e9b594a3d94317aaf51f5c3c79a8feaa')
