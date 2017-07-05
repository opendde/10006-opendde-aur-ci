# Maintainer: Alexander Phinikarides <alexisph _AT_ gmail _DOT_ com>

_pkgname=pyroute2
pkgname=python2-${_pkgname}
pkgver=0.4.17
pkgrel=1
pkgdesc="A pure Python netlink and Linux network configuration library. (Python2 version)"
arch=(any)
url="http://docs.pyroute2.org/"
license=('GPL2')
depends=('python2')
makedepends=(
  'python2-setuptools'
  'python2-flake8'
  'python2-coverage'
  'python2-nose')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8ae522eaf46281df32f54632b1015b02f650304d5107e56b96912fb7cf1734e6')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -rf docs/html "${pkgdir}/usr/share/doc/${pkgname}/"
}

