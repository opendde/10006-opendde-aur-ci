# Maintainer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: BlackArch

pkgname='python2-bs4'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Beautiful Soup. bs4 name required by CrackMapExec'
arch=('any')
url='https://pypi.python.org/pypi/bs4/'
license=('custom:unknown')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/10/ed/7e8b97591f6f456174139ec089c769f89a94a1a4025fe967691de971f314/bs4-${pkgver}.tar.gz")
sha1sums=('b309d9b50489cc64263d11491e6a19c29c3a484d')

build() {
  cd "$srcdir/bs4-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/bs4-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

