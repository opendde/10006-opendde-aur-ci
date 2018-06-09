# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=pylms8001
pkgver=r1.7d50b60
pkgrel=1
pkgdesc="Python bindings for LMS8001."
arch=(any)
url="https://github.com/myriadrf/pyLMS8001"
license=('Apache')
depends=('python2-pyserial')
makedepends=('git')
provides=('pylms8001')
conflicts=('pylms8001')
source=("git+$url")
md5sums=('SKIP')

_rname=pyLMS8001

pkgver() {
  cd $srcdir/$_rname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_rname
  python2 setup.py build
}

package() {
  cd $srcdir/$_rname
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
