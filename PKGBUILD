# $Id$
# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=curl-http2
_pkgname=curl
pkgver=7.53.1
pkgrel=1
pkgdesc="A URL retrieval utility and library (HTTP/2 enabled)"
arch=('i686' 'x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'openssl' 'zlib' 'libpsl'
         'libnghttp2')
provides=("curl=$pkgver" 'libcurl.so')
conflicts=('curl' 'curl-git' 'curl-http2-git')
options=('strip')
source=("https://curl.haxx.se/download/$_pkgname-$pkgver.tar.gz"
        'curlbuild.h')
sha512sums=('f4bd2bcbf0eca312be549d2552e453b9634bbe8f74a981c1d663c42efc79cc44b419d9f37da8f6fe2f315487e55a41078cbfcd0d82af4ec84885464b56b6d217'
            '4e71366c3faaab76a6e438fcc484fb1ce16b2ae84eefa176879cf164e8fb0b04e4a355384e66a1137e9641e95041ee573553b43da98ec92820696d7256beb4f5')

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --enable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
      --with-nghttp2=/usr

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  local wordsize=$(cpp -include 'bits/wordsize.h' <<<'__WORDSIZE' | sed '$!d')
  local _curlbuild=curlbuild-$wordsize.h

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  # devel
  mv "$pkgdir/usr/include/curl/curlbuild.h" "$pkgdir/usr/include/curl/$_curlbuild"
  install -m644 "$srcdir/curlbuild.h" "$pkgdir/usr/include/curl/curlbuild.h"
}
