# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name="bugsnag"
_srcname='${_name}-python'
pkgname="python-${_name}-git"
provides=("python-${_name}")
conflicts=("python-${_name}")
pkgver=3.6.0.r0.g017c300
pkgrel=1
pkgdesc='Automatic error monitoring for django, flask, etc.'
arch=('any')
url="https://www.bugsnag.com/platforms/python-error-reporting"
license=('MIT')
source=("git://github.com/bugsnag/bugsnag-python.git")
makedepends=('git' 'python-setuptools')
depends=(
    'python'
    'python-webob'
    'python-six>=1.9'
    'python-six<2')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

build() {
    cd "${srcdir}/${_srcname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_srcname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
