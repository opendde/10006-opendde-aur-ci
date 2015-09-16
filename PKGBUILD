# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts at gmail dot com>
pkgname=python-ldif3
pkgver=3.1.0
pkgrel=1
pkgdesc="generate and parse LDIF data"
arch=('any')
url="https://github.com/xi/ldif3"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/xi/ldif3/archive/$pkgver.tar.gz")
md5sums=('1ddd5b41fd534c84c88d1357b8b37f83')

package() {
  cd "$srcdir/ldif3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
