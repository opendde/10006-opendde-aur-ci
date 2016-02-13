# Maintainer: Tom Willemse <tom@ryuslash.org>

_python=python
_name=ansicolors

pkgname=$_python-ansicolors
pkgver=1.0.2
pkgrel=1
pkgdesc="ANSI colors for Python"
depends=('python')
arch=('any')
source=("http://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('d3a19fcd75c89772360e0d2b693fc50f')
url="http://github.com/verigak/colors/"
license=('custom:ISC')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    $_python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
