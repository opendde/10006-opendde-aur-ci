# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=libaesrand-git
_pkgname=libaesrand

pkgver=0.1.0.r0.gabeba78
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="AES-based random integer generator functions."
url="https://github.com/spaceships/libaesrand"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gmp' 'openssl' 'flint' 'mpfr')
makedepends=('git' 'gcc' 'make')
conflicts=()
replaces=()
backup=()
conflicts=('libaesrand')
provides=('libaesrand')
md5sums=('SKIP')

source=("git://github.com/spaceships/libaesrand.git")

build() {
    cd $srcdir/${_pkgname}
    ./configure --prefix=/usr
    make
}

package() {
  cd $srcdir/$_pkgname 
  make DESTDIR=${pkgdir} install
}
