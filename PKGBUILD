
pkgname=python2-feedgen
_pkgname=feedgen
pkgver=0.3.1
pkgrel=1
pkgdesc="This module can be used to generate web feeds in both ATOM and RSS format. It has support for extensions. Included is for example an extension to produce Podcasts."
url="http://lkiesow.github.io/python-feedgen"
arch=('any')
license=('GPL')
depends=('python2' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('639556c8d4f62a15d8f0227c936f0ea0')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python2 setup.py install --root="${pkgdir}" || return 1
}
