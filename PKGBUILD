pkgname=mitogen
pkgver=0.2.6
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('80ce1ad816da7c1d872a4b239577b376')
sha1sums=('055cf847a1896a1b4c7a05c30ab0956836317af6')
sha256sums=('66d35eb6187f4551158d744d3b83469823846c57f26d13d92f6ee3fb8aa83f33')
sha384sums=('4ebc9c20e478b75c027d061dad2dba15765a3d82cbb100b81dfacb9debe5636e668d45b5e08f0f8a4e6ac07b61afc464')
sha512sums=('35b44bf310800c5a22eb4f06133deca0977dea70f1bd564edb092fe9dff3758fcc587e4bca9165143bcf5d4a36de940c6b4e6cd44a78cacbbd707cc1a5a175fe')
