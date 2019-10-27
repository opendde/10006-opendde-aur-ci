# Maintainer: lilydjwg <lilydjwg@gmail.com>

_pkgname=cld3
_reponame=$_pkgname
pkgname=python-${_pkgname}-git
pkgver=0.2.2.20181228
pkgrel=1
pkgdesc='Python bindings for cld3 (Compact Language Detector v3)'
arch=('i686' 'x86_64')
url='https://github.com/Elizafox/cld3'
license=('BSD3')
depends=('python')
makedepends=('git')
source=('git+https://github.com/Elizafox/cld3.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  echo $(awk -F'"' '/version=/ { print $2 }' setup.py).$(git log -1 --pretty='%cd' --date=short | tr -d '-')
}

build() {
  cd "$srcdir/$_reponame"
  python setup.py build
}

package() {
  cd "$srcdir/$_reponame"
  python setup.py install --root=$pkgdir --optimize=1
}
