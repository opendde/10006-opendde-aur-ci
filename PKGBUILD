# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

pkgbase=python-pytoml
pkgname=(python-pytoml python2-pytoml)
_pypiname=pytoml
pkgver=0.1.4
pkgrel=1
pkgdesc="A TOML-0.4.0 parser/writer for Python."
arch=('any')
url="http://pypi.python.org/pypi/$_pypiname"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'unzip')
checkdepends=('python-nose' 'python2-nose')
optdepends=()
source=("http://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.zip")
sha512sums=(SKIP)

prepare() {
  cp -r $_pypiname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py build

  cd "$srcdir/$_pypiname-$pkgver-py2"
  python2 setup.py build
}

check() {
  # Missing data files for running tests

  cd "$srcdir/$_pypiname-$pkgver"
  #nosetests3

  cd "$srcdir/$_pypiname-$pkgver-py2"
  #nosetests2
}

package_python-pytoml() {
  depends=('python')

  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pytoml() {
  depends=('python2')

  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

