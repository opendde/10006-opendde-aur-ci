# Maintainer: Niklas Krafczyk <krafczyk.n at gmail dot com>
pkgname=klee-uclibc
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="uclibc for a symbolic virtual machine built on top of the LLVM compiler infrastructure"
arch=('x86_64')
url="https://klee.github.io/"
license=('LGPL2.1')
groups=()
depends=()
makedepends=('llvm>=3.4'
             'clang'
             'git')
checkdepends=()
optdepends=()
provides=('klee-uclibc')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/klee/klee-uclibc.git#tag=klee_uclibc_v1.2")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "$srcdir/klee-uclibc"
    DEVEL_PREFIX="/usr/share/klee-uclibc/" ./configure --make-llvm-lib
    sed -i 's|DEVEL_PREFIX="[^"]*"|DEVEL_PREFIX="/usr/share/klee-uclibc/usr"|' .config
    sed -i 's|RUNTIME_PREFIX="[^"]*"|RUNTIME_PREFIX="/usr/share/klee-uclibc/usr"|' .config
}

build() {
    cd "$srcdir/klee-uclibc"
	make -j$(nproc)
}

package() {
	cd "$srcdir/klee-uclibc"
	make DESTDIR="$pkgdir/" install
}
