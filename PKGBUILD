# Maintainer: Lev Levitsky <levlev at mail.ru>

pkgname=python-pynumpress
_bname=pynumpress
pkgver=0.0.5
pkgrel=1
pkgdesc="A more pythonic wrapper around the MSNumpress library for mass spectrometry numerical data compression"
arch=('x86_64')
url="https://github.com/mobiusklein/pynumpress"
license=('Apache')
depends=('python-numpy')
makedepends=('cython')
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/${_bname}/${_bname}-${pkgver}.tar.gz")
sha256sums=('1dfa54928a687f292a3901ec6c5383379029061b3bb5e8cdbeabf115e2ddc1e4')

package() {
  cd "$srcdir/${_bname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
