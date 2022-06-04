# Maintainer: Chris Kobayashi <software+aur@disavowed.jp>

pkgname="dieharder-git"
pkgver=20220604.g3742fd7
pkgrel=1
pkgdesc="A Random Number Test Suite (that actually compiles)"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://github.com/christopherkobayashi/dieharder"
depends=( 'gsl' )
makedepends=('automake' 'autoconf' )
conflicts=('dieharder')
source=('dieharder::git+https://github.com/christopherkobayashi/dieharder.git')
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/dieharder"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
    cd "${srcdir}/dieharder"
    ./autogen.sh && make
}

package() {
    cd "${srcdir}/dieharder"
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
