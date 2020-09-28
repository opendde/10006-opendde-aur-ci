pkgname='kex-git'
pkgver='r52.96d1fa2'
pkgrel=1
pkgdesc="KolibriOS emulator for running applications."
url="https://github.com/tsdima/kex"
source=("git://github.com/tsdima/kex.git")
license=('GPLv3')
arch=('any')
depends=('curl' 'p7zip')
makedepends=('git' 'libx11' 'gcc' 'libxrender')
md5sums=('SKIP')
groups=('kos32-dev')
install=$pkgname.install


build(){
    cd kex
    gcc -o kex main.c k_*.c -lX11 -lXrender -lrt -llzma -ldl -D_GNU_SOURCE
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/kex/kex $pkgdir/usr/bin
    cp $startdir/kex-setup $pkgdir/usr/bin 
}


