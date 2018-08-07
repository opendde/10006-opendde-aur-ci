# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=first
pkgname="python-${_pkgname}"
pkgver=2.0.1
pkgrel=2
pkgdesc="Provides a Python function to get the first element of an iterator."
arch=('any')
url="https://github.com/hynek/first/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3bb3de3582cb27071cfb514f00ed784dc444b7f96dc21e140de65fe00585c95e')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
