# $Id$
# Maintainer: Martchus <martchus@gmx.net>

_pkg_arch=x86
_android_arch=x86
_android_platform=22 # https://developer.android.com/about/dashboards/
_android_platform_arch=arch-x86
_pkgname=openssl
_ver=1.1.1c

pkgname=android-$_pkg_arch-$_pkgname
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=2
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android, $_pkg_arch)"
arch=('any')
url='https://www.openssl.org'
license=('custom:BSD')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
depends=('android-sdk' 'android-ndk')
makedepends=('android-environment' 'android-sdk-build-tools')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc})
sha256sums=('f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

build() {
  cd "$srcdir/$_pkgname-$_ver"
  source android-env ${_pkg_arch}
  export PATH="$ANDROID_TOOLCHAIN/bin:$PATH"

  # don't use -mandroid flag (Clang as provided by the NDK does not like it)
  sed -i -e 's/-mandroid//' Configurations/15-android.conf

  ./Configure \
    --prefix="${ANDROID_PREFIX}" \
    --openssldir="${ANDROID_PREFIX}" \
    -D__ANDROID_API__=$_android_platform \
    -Wl,--no-allow-shlib-undefined \
    -Wl,--no-undefined \
    no-stdio \
    no-ui \
    threads \
    shared \
    android-${_android_platform_arch##arch-}

  # get rid of debug printing so the library doesn't depend on stdio (no-stdio and no-ui are not entirely sufficient)
  sed -i -e 's/\#define TEST_ENG_OPENSSL_RC4_P_INIT//' crypto/engine/eng_openssl.c

  # build only libraries
  make depend
  make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" SHLIB_VERSION_NUMBER= SHLIB_EXT=.so build_libs
}

package() {
  cd "$srcdir/$_pkgname-$_ver"
  source android-env ${_pkg_arch}
  export PATH="$ANDROID_TOOLCHAIN:$PATH"

  # install header files, libraries and license
  for lib in libcrypto.{a,so} libssl.{a,so}; do
    install -D -m0644 $lib "$pkgdir/${ANDROID_PREFIX_LIB}/$lib"
  done
  for pc in libcrypto.pc libssl.pc openssl.pc; do
    install -D -m0644 $pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/$pc"
  done
  mkdir -p "$pkgdir/${ANDROID_PREFIX_INCLUDE}"
  cp -r include/openssl "$pkgdir/${ANDROID_PREFIX_INCLUDE}"
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # strip binaries
  find "$pkgdir" -name 'lib*.so' -type f -exec "$ANDROID_STRIP" --strip-unneeded {} \;
  find "$pkgdir" -name 'lib*.a' -type f -exec "$ANDROID_STRIP" -g {} \;
}
