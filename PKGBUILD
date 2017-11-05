# Maintainer: David McInnis <dave@dave3.xyz>

pkgbase=('python-pysendfile')
pkgname=('python-pysendfile' 'python2-pysendfile')
_module='pysendfile'
pkgver='2.0.1'
pkgrel=1
pkgdesc="A Python interface to sendfile(2)"
url="https://github.com/giampaolo/pysendfile"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pysendfile/pysendfile-${pkgver}.tar.gz")
sha256sums=('510a414b270986fba3c79cb76d90a4c910c701bfb43ff983a5d4e92846050e17')

prepare() {
    cd "$srcdir/"
    cp -a "${_module}-${pkgver}" "${_module}-${pkgver}-py2"
    cd "${_module}-${pkgver}"
    sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
        -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
        -i $(find . -name '*.py')
}

build() {
    msg "Building Python 2"
    cd "$srcdir/${_module}-${pkgver}-py2"
    python2 setup.py build

    msg "Building Python 3"
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}


package_python-pysendfile() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pysendfile() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
