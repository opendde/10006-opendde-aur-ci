# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

_target="powerpc64-linux-gnu"
pkgname=${_target}-glibc-headers
pkgver=2.27
pkgrel=1
pkgdesc="GNU C Library headers (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc/"
license=(GPL LGPL)
depends=("${_target}-linux-api-headers>=4.16.1-1")
makedepends=("${_target}-gcc-stage1>=8.1.0-1")
options=(!buildflags !strip staticlibs)
_commit=23158b08a0908f381459f273a984c6fd328363cb
#source=(git+https://sourceware.org/git/glibc.git#commit=$_commit
source=(https://ftp.gnu.org/gnu/glibc/glibc-$pkgver.tar.xz{,.sig})
validpgpkeys=(7273542B39962DF7B299931416792B4EA25340F8) # Carlos O'Donell
md5sums=('898cd5656519ffbc3a03fe811dd89e82'
         'SKIP')

prepare() {
  mkdir -p glibc-build

  [[ -d glibc-$pkgver ]] && ln -s glibc-$pkgver glibc
  cd glibc

  local i; for i in ${source[@]}; do
    case ${i%::*} in
      *.patch)
        msg2 "Applying ${i}"
        patch -p1 -i "$srcdir/${i}"
        ;;
    esac
  done
}

build() {
  local _configure_flags=(
      --prefix=/
      --with-headers=/usr/${_target}/include
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --disable-multi-arch
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --disable-profile
      --disable-werror
  )

  cd glibc-build

  echo "slibdir=/lib" >> configparms
  echo "rtlddir=/lib" >> configparms
  echo "sbindir=/bin" >> configparms
  echo "rootsbindir=/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  "$srcdir/glibc/configure" \
      --libdir=/lib \
      --libexecdir=/lib \
      ${_configure_flags[@]} \
      --target=${_target} \
      --host=${_target} \
      --build=${CHOST}

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd glibc-build

  make install_root="$pkgdir/usr/$_target" install-headers \
    install-bootstrap-headers=yes

  # glibc doesn't support eglibc's install-bootstrap-headers
  # Luckily a blank gnu/stubs.h is all we need
  touch "$pkgdir/usr/$_target/include/gnu/stubs.h"

  mkdir -p "$pkgdir/usr/$_target/lib"
  cp csu/crt1.o csu/crti.o csu/crtn.o "$pkgdir/usr/$_target/lib"

  # create stub lib
  ${_target}-gcc -nostdlib -nostartfiles -shared -x c /dev/null \
    -o "$pkgdir/usr/$_target/lib/libc.so"

  mkdir -p "$pkgdir/usr/$_target/usr"
  ln -s ../{include,lib} "$pkgdir/usr/$_target/usr"
}
