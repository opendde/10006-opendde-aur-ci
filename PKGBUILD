# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python2-pyrss2gen
_pyname=PyRSS2Gen
pkgver=1.1
pkgrel=2
pkgdesc='A Python library for generating RSS 2.0 feeds.'
arch=('any')
url="http://www.dalkescientific.com/Python/PyRSS2Gen.html"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("http://www.dalkescientific.com/Python/${_pyname}-${pkgver}.tar.gz")
md5sums=("c56b9453d52b0a70be4f3e95112058aa")
conflicts=('pyrss2gen')
provides=('pyrss2gen')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
