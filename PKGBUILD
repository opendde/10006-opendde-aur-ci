# Maintainer: Carl George < arch at cgtx dot us >

_name="click"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="5.1"
pkgrel="1"
pkgdesc="A simple wrapper around optparse for powerful command line utilities."
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-pytest" "python2-pytest")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('678c98275431fad324275dec63791e4a17558b40e5a110e20a82866139a85a5a')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

check() {
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export PYTHONPATH="$(pwd)/build/lib:$PYTHONPATH"
    cd "${srcdir}/${_name}-${pkgver}"
    py.test --tb=short
    cd "${srcdir}/${_name}-${pkgver}-python2"
    py.test2 --tb=short
}

package_python-click() {
    depends=("python>=3.3")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click() {
    depends=("python2>=2.6")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
