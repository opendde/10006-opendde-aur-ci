# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.8.0
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=(
    python
    python-importlib_resources
    python-requests
    python-toml
)
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/1b/8e/43630bec3f2e75f8c95cdd8f744091e0baee52680c86eb9332f9113b5b1a/${_gitname}-${pkgver}.tar.gz")
b2sums=('35e21bb9501b08f8f854eb6efa8917b46b228216fa47852f180589017b28ce5e28636c0dfe11082369bdcc5d90b60852e54aa354cb668da0a1a125a23ff86d06')

build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

