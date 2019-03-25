# Maintainer: Frederic Van Assche <frederic@fredericva.com>
# Adapted from package by: Maxime Gauduin <alucryd@archlinux.org>
# Patch by: Alessandro Ghedini <ghedo@debian.org>

pkgname=libcurl3-gnutls
pkgver=7.64.0
pkgrel=1
pkgdesc='An URL retrieval library (linked against gnutls) with libcurl3 versioned symbols'
arch=('x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('curl' 'glibc' 'gnutls' 'libpsl' 'nettle' 'zlib'
         'libssh2.so')
options=('strip')
conflicts=('libcurl-gnutls')
source=("https://curl.haxx.se/download/curl-${pkgver}.tar.gz"{,.asc}
        03_keep_symbols_compat.patch)
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
sha512sums=('ea0e68f9cbf2eb4f235d8506962dcc7709f769ef3526c0e4c130fdaf7186a1a13b303c6ce919cb9125bbf7c64ddf4f8efb3d9269b906f856e6d7b3def027fb81'
            'SKIP'
            '596c227bb5ede8182831c5c92b3ac7b74b770f51fae99277e2aabb02d38b7a5d4d06003731042ab5403ca89e719827d7080c3a179e29ef08b41a1993a7788a33')

prepare() {
  cd curl-${pkgver}

  patch -p1 < ${srcdir}/03_keep_symbols_compat.patch
}

build() {
  cd curl-${pkgver}

  ./configure \
    --prefix='/usr' \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --enable-versioned-symbols \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --without-gssapi \
    --with-libssh2 \
    --without-libidn \
    --without-ssl \
    --with-gnutls='/usr' \
    --with-random='/dev/urandom' \
    --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'

  make -C lib
}

package() {
  cd curl-${pkgver}

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-gnutls}.so.4.5.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  for version in 3 4 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0; do
    ln -s libcurl-gnutls.so.4.5.0 "${pkgdir}"/usr/lib/libcurl-gnutls.so.${version}
  done

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-gnutls
}

# vim: ts=2 sw=2 et:
