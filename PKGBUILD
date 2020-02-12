# Maintainer: Ryan Suchocki <ryan@suchocki.co.uk>
# Maintainer: Martin Kröning <m.kroening@hotmail.de>
_target=riscv64-unknown-elf
pkgname=$_target-gdb
pkgver=9.1
pkgrel=1
pkgdesc='The GNU Debugger for the 32bit and 64bit RISC-V bare-metal target'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile2.0 gdb-common mpfr)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
sha256sums=('699e0ec832fdd2f21c8266171ea5bf44024bd05164fdf064e4d10cc4cf0d1737'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

prepare() {
  cd gdb-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  mkdir -p build && cd build
  ../configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --enable-multilib \
    --enable-interwork \
    --with-system-readline \
    --disable-nls \
    --with-python=/usr/bin/python \
    --with-guile=guile-2.0 \
    --with-system-gdbinit=/etc/gdb/gdbinit

  make
}

package() {
  cd gdb-$pkgver/build

  make -C gdb DESTDIR=$pkgdir install

  # Following files conflict with 'gdb'/'gdb-common' packages
  rm -r $pkgdir/usr/include/gdb/
  rm -r $pkgdir/usr/share/gdb/
  rm -r $pkgdir/usr/share/info/
  rm -r $pkgdir/usr/share/man/man5/
}
