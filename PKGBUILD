# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>

pkgname=python2-textx
_srcname=textX
pkgver=2.0.1
pkgrel=3
pkgdesc="Python library for building Domain-Specific Languages and parsers"
arch=('any')
url="http://textx.github.io/textX/"
license=('MIT')
depends=('python2' 'python2-arpeggio' 'python2-click')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-pip' 'python2-jinja')
source=($pkgname-$pkgver.tar.gz::https://github.com/textX/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('cc4fe6d5db278477b15afd5d349c1cda')

build() {
  cd $_srcname-$pkgver
  python2 setup.py build
}

check() {

  cd $_srcname-$pkgver

  # Install all tests projects
  pip2 install --user -e . || exit 1
  pip2 install --user -e tests/functional/subcommands/example_project || exit 1
  pip2 install --user -e tests/functional/registration/projects/types_dsl || exit 1
  pip2 install --user -e tests/functional/registration/projects/data_dsl || exit 1
  pip2 install --user -e tests/functional/registration/projects/flow_dsl || exit 1
  pip2 install --user -e tests/functional/registration/projects/flow_codegen || exit 1

  # Run all tests
  python2 setup.py pytest --addopts tests/functional

  # Uninstall all test projects
  pip2 uninstall -y textX || exit 1
  pip2 uninstall -y textX-subcommand-test || exit 1
  pip2 uninstall -y types_dsl || exit 1
  pip2 uninstall -y data_dsl || exit 1
  pip2 uninstall -y flow_dsl || exit 1
  pip2 uninstall -y flow_codegen || exit 1
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv $pkgdir/usr/bin/textx $pkgdir/usr/bin/textx2
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
