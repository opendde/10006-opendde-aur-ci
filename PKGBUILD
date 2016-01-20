# Maintainer: Nathan Isom <nathanisom27[at]gmail[dot]com>

_pkgname=colort
pkgname=${_pkgname}-git
pkgver=1
pkgrel=1
pkgdesc='colort[int] - adjust colors by values.'
arch=('i686' 'x86_64')
url="https://github.com/2c58/${_pkgname}"
license=('custom:Unlicense')
depends=()
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/2c58/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make install
}
