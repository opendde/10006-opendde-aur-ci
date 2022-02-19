# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: tsipizic

pkgname=python-yeelight
pkgver=0.7.9
pkgrel=1
_commit=8ecef2f8
pkgdesc='Python library for controlling YeeLight RGB bulbs'
arch=('any')
url='https://gitlab.com/stavros/python-yeelight'
license=('BSD')
depends=('python-future' 'python-ifaddr')
makedepends=(
  'git'
  'python-flit-core'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx'
  'python-sphinx_rtd_theme')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('3D2E921F15667F0FD5B3017E26EA345ECD4C2A63')

build() {
  cd "$pkgname"
  PYTHONPATH=./ python -m build --wheel --skip-dependency-check --no-isolation
  cd docs
  PYTHONPATH=../ make man
}

package() {
  export PTYHONHASHSEED=0
  cd "$pkgname"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/build/man/yeelight.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
