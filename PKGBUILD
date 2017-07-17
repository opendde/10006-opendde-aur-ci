# Maintainer: fzerorubigd <fzero@rubi.gd>
_pkgmain=backports.csv
pkgname=python-$_pkgmain
pkgver=1.0.5
pkgrel=1
pkgdesc="Backport of Python 3 csv module."
arch=('any')
url="https://github.com/ryanhiebert/backports.csv"
license=('BSD')
groups=()
depends=('python')
provides=('python-backports.csv')
options=(!emptydirs)
source=($pkgname-$pkgver.zip::https://github.com/ryanhiebert/backports.csv/archive/${pkgver}.zip)

package() {
  cd "$srcdir/$_pkgmain-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('83115c741cf32715eff3573b0ec5bb06')
