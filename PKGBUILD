# Maintainer: LGuy9 <thelinuxguy9@gmail.com>

pkgname=htim
pkgver=3.2.0
pkgrel=8
pkgdesc="Htop improved, htop with vim key bindings"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://gitlab.com/thelinuxguy9/htim"
license=('GPL2')
depends=(ncurses libnl)
makedepends=()
optdepends=()
provides=('htop')
conflicts=('htop')
source=(https://gitlab.com/thelinuxguy9/htim/-/archive/master/htim-master.tar.bz2)
md5sums=('7bdaeeafd5b5b535af5018711d9319f9')
validpgpkeys=()

prepare() {
        cd "$srcdir/htim-master"
        ./autogen.sh
        ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-unicode
}

build() {
        cd "$srcdir/htim-master"
        make
}

package() {
        cd "$srcdir/htim-master"
        make DESTDIR="$pkgdir/" install
}
