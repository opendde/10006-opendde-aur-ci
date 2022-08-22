# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astrodendro
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.2.0
pkgrel=2
pkgdesc="Python package for computation of astronomical dendrograms"
arch=('any')
url="https://dendrograms.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools'
#            'python-wheel'
#            'python-build'
#            'python-installer'
             'python-sphinx-automodapi'
             'python-aplpy')
checkdepends=('python-pytest'
              'python-mock'
              'python-h5py') # 'python-astropy' 'python-matplotlib'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-collection-py3.10.patch'
        'new-doc-building.patch')
md5sums=('6f4155b1d4a4b2d9cb9ae154f88c5710'
         '1b5d8b8c5d0387a09b15c02fc1b40714'
         '2bd96deeaa18ae57c196246b74ee8030')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-collection-py3.10.patch"
    patch -Np1 -i "${srcdir}/new-doc-building.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
##   python setup.py build_sphinx
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-astrodendro() {
    depends=('python' 'python-numpy>=1.4.1' 'python-astropy>=0.2.0' 'python-h5py>=0.2.0')
    optdepends=('python-matplotlib: For plotting'
                'python-pytest: For testing'
                'python-mock: For testing'
                'python-astrodendro-doc: Documentation for astrodendro')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#   install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astrodendro-doc() {
    pkgdesc="Documentation for Python astrodendro module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
