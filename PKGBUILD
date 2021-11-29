# Maintainer: Nathaniel R. Lewis <linux.robotdude@gmail.com>
# Contributor: Chloe Brown <chloe dot brown dot 00 at outlook dot com>

_pkgbase='herdtools7'
pkgname=('herdtools7-git')
provides=('herdtools7')
conflicts=('herdtools7')
pkgver=7.52.r1322.g650450b6
pkgrel=1
pkgdesc="The Herd toolsuite to deal with .cat memory models"
arch=('i686' 'x86_64')
url='https://github.com/herd/herdtools7'
license=('CeCILL-B')
depends=('ocaml')
makedepends=('git' 'make' 'dune' 'ocaml-menhir')
source=('git://github.com/herd/herdtools7')
sha256sums=('SKIP')

build() {
    cd $srcdir/$_pkgbase
    make PREFIX="/usr"
}

pkgver() {
    cd $srcdir/$_pkgbase
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    make -C $srcdir/$_pkgbase PREFIX="$pkgdir/usr" install
}

