# Maintainer: Bryce Guinta <bryce.paul.guinta@gmail.com>
pkgbase=('python-xvfbwrapper')
pkgname=('python-xvfbwrapper' 'python2-xvfbwrapper')
_module='xvfbwrapper'
pkgver='0.2.8'
pkgrel=1
pkgdesc="run headless display inside X virtual framebuffer (Xvfb)"
url="https://github.com/cgoldberg/xvfbwrapper"
depends=('xorg-server-xvfb')
makedepends=('python-setuptools' 'python2-setuptools' 'coreutils')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/$(echo ${_module:0:1} | tr '[:upper:]' '[:lower:]')/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('c8ce7c35fc555a6af272e7e17cf0b5c0')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-xvfbwrapper() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-${_module}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-xvfbwrapper() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-${_module}/LICENSE"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
