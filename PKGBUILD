# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-opencensus
pkgver=0.7.13
pkgrel=1
pkgdesc='A stats collection and distributed tracing framework'
arch=('any')
url='https://github.com/census-instrumentation/opencensus-python'
license=('Apache-2.0')
depends=('python' 'python-google-api-core')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/census-instrumentation/opencensus-python/archive/v$pkgver.tar.gz")
sha256sums=('70ca7925666f6d25fc0b0d4c09274d5849a1da8b9b2ba1436be7d20225cc88c2')

_pkgname=opencensus-python

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/context/opencensus-context"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/context/opencensus-context"
  python setup.py install --root="$pkgdir"/ --optimize=1

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
