# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-hep_ml
_pkgbase=hep_ml
pkgname=('python2-hep_ml' 'python-hep_ml')
pkgver=0.5.0
pkgrel=2
pkgdesc="Specific machine learning tools for purposes of high energy physics"
arch=('any')
url="https://arogozhnikov.github.io/hep_ml/"
license=('Apache')
makedepends=('python2-scipy' 'python-scipy' 'python2-setuptools' 'python-setuptools' 'cython2' 'cython'
             'python2-pandas' 'python-pandas' 'python2-scikit-learn' 'python-scikit-learn' 'python2-theano' 'python-theano')
options=(!emptydirs)

source=("https://github.com/arogozhnikov/${_pkgbase}/archive/v${pkgver}.zip")
sha256sums=('e5145fd84b6876941807bb80fde4ff2e38fd16fb76152b83da70338022074821')

prepare() {
  cd "${srcdir}"
  cp -a "hep_ml-${pkgver}" "hep_ml-py2-${pkgver}"
  cd "hep_ml-py2-${pkgver}"

  msg2 "Adjusting Python 2 shebangs..."
  find . -name '*.py' -type f -exec \
      sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
          -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
          -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
          -i '{}' \; -print
}

build() {
  msg2 "Building Python2"
  cd "${srcdir}/hep_ml-py2-${pkgver}"
  python2 setup.py build

  msg2 "Building Python3"
  cd "${srcdir}/hep_ml-${pkgver}"
  python setup.py build
}

package_python2-hep_ml() {
  depends=('python2-scipy' 'python2-six' 'python2-pandas' 'python2-theano' 'python2-scikit-learn' 'python2-numpy')
  cd "${srcdir}/hep_ml-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-hep_ml() {
  depends=('python-scipy' 'python-six' 'python-pandas' 'python-theano' 'python-scikit-learn' 'python-numpy')
  cd "${srcdir}/hep_ml-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # See FS#49651
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
