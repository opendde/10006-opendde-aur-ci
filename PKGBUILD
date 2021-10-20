# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-avocado
pkgver=92.0
pkgrel=1
pkgdesc="Set of tools and libraries to help with automated testing"
arch=('any')
url="http://avocado-framework.github.io/"
license=('GPL2')
source=("https://github.com/avocado-framework/avocado/archive/${pkgver}.tar.gz")
sha256sums=('992cad199aaadfc4a311f2d1e7f35c032080e2d08ce3ca70a95c93fd4062c827')
depends=('python' 'libvirt-python')
makedepends=('python-setuptools' 'python-docutils')

build() {
  cd "avocado-${pkgver}"
  python setup.py build
  make man
}

false &&
check() {
  cd "avocado-${pkgver}"
  make check-full
}

package() {
  cd "avocado-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 man/*.1 "$pkgdir/usr/share/man/man1/"
}
