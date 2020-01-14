# Maintainer: gardar <aur@gardar.net>  

pkgbase="python-git-url-parse"
_pkgname="git-url-parse"
pkgname=("python-git-url-parse" "python2-git-url-parse")
pkgver=1.2.2
pkgrel=1
pkgdesc='A simple GIT URL parser similar to giturlparse.py.)'
url="https://github.com/coala/${_pkgname}"
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools' 'python-pbr'
             'python2' 'python2-setuptools' 'python2-pbr')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/coala/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('50e58f899449212409195558b066e1f7cc542c8dd2784bccaffd5ba246d1e2c9')

prepare() {
  cp -a ${_pkgname}-$pkgver{,-py2}
}

build() {
    export PBR_VERSION="${pkgver}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_python-git-url-parse() {
    depends=('python')
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-git-url-parse() {
    depends=('python2')
    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
