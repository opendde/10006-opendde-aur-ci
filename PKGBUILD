# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-msrest
pkgver=0.4.26
pkgrel=1
pkgdesc='The runtime library for AutoRest generated Python clients.'
arch=('any')
url="https://github.com/Azure/msrest-for-python"
license=('MIT')
depends=('python-isodate' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrest-for-python/archive/v${pkgver}.tar.gz")
md5sums=('327b780c79e4404c70fd8d3a771a0e42')

build() {
  cd "msrest-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrest-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
