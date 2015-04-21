# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python2-jellyfish
pkgver=0.4.0
pkgrel=1
pkgdesc='A python library for doing approximate and phonetic matching of strings'
arch=('i686' 'x86_64')
url='https://github.com/sunlightlabs/jellyfish'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/j/jellyfish/jellyfish-${pkgver}.tar.gz")
sha256sums=('89f6264b98b11a40528c0faf6e2035c15023b628b3e51c62fd2082d103b100cc')

build() {
  cd jellyfish-${pkgver}

  python2 setup.py build
}

package() {
  cd jellyfish-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/licenses/python2-jellyfish
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/python2-jellyfish/
}

# vim: ts=2 sw=2 et:
