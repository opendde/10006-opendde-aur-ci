# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-sphinx-astropy
_pyname=${pkgname#python-}
pkgver=1.5
pkgrel=1
pkgdesc="Sphinx extensions and configuration specific to the Astropy project"
arch=('i686' 'x86_64')
url="https://github.com/astropy/sphinx-astropy"
license=('BSD')
depends=('python-sphinx>=1.7' 'python-astropy-sphinx-theme' 'python-sphinx-automodapi' 'python-sphinx-gallery' 'python-numpydoc' 'python-pillow' 'python-pytest-doctestplus>=0.10.1')
makedepends=('python-setuptools')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9e11a1dad7d96cd93390b635309adaa6')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
