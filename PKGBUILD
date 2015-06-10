# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-yapsy
pkgname=('python-yapsy' 'python2-yapsy')
_pyname=Yapsy
pkgver=1.10.423
pkgrel=2
pkgdesc='Yet Another Plugin SYstem'
arch=('any')
url='http://yapsy.sourceforge.net/'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fb0e0afbfc1e6086e7d34e093cf3f294')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-yapsy() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-yapsy() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
