pkgbase=('wrld')
pkgname=('wrld')
_module='wrld'
pkgver='0.6'
pkgrel=1
pkgdesc="simplified bash loops (or, xargs -I on steroids)"
url="https://github.com/ninjaaron/wrld"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/a4/3f/4e3692af943e9e36a6d4f9134c5da6229c7a0416703a7421c9002e01438f/wrld-0.6.tar.gz")
md5sums=('9f09fbbe4c5b9cbb9822267e76dcc2ce')

build() {
    cd "${srcdir}/wrld-0.6"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/wrld-0.6"
    pip3 install --ignore-installed --root="${pkgdir}" "wrld"*.whl
}
