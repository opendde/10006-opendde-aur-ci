# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: aarch64-binutils -> aarch64-linux-api-headers -> aarch64-gcc-bootstrap -> aarch64-glibc -> aarch64-gcc -> aarch64-glibc (again)

_arch=aarch64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-gcc-bootstrap
pkgver=12.1.0
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for ARM64 target - bootstrap compiler'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(libmpc zstd libisl)
makedepends=($_arch-binutils)
provides=($_arch-gcc)
conflicts=($_arch-gcc)
options=(!emptydirs !strip staticlibs)
_commit=908e612067e42ded881db10d38768f23307bf55e
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig})

sha256sums=('62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b'
	'SKIP')

validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  rm -rf "$srcdir"/gcc-build
  mkdir "$srcdir"/gcc-build
}

build() {
  cd gcc-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir"/gcc-$pkgver/configure \
      --prefix=/usr \
      --with-sysroot=/usr/$_target/sys-root \
      --libexecdir=/usr/lib \
      --target=$_target \
      --disable-nls \
      --enable-languages=c \
      --with-system-zlib \
      --disable-multilib --disable-werror \
      --disable-threads --without-headers  \
      --disable-shared --with-newlib

  make all-gcc all-target-libgcc
}

package() {
  cd gcc-build

  make install-strip-gcc install-strip-target-libgcc DESTDIR="$pkgdir"
  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/{include,share}

}
