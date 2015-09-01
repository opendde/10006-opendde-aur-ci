_pkgbasename=nss
pkgname=lib32-${_pkgbasename}-chacha20
pkgver=3.20
pkgrel=0
pkgdesc="Mozilla Network Security Services with ChaCha20-Poly1305 (32-bit)"
arch=('x86_64')
url="http://www.mozilla.org/projects/security/pki/nss/"

#download_url=ftp://ftp.mozilla.org/pub/security/nss/releases/
#alternative download link
#ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_${pkgver//./_}_RTM/src/${_pkgbasename}-${pkgver}.tar.gz

license=('MPL' 'GPL')
_nsprver=4.10.7
depends=("lib32-nspr>=${_nsprver}" 'lib32-sqlite>=3.6.17' "${_pkgbasename}" 'lib32-zlib' 'lib32-p11-kit')
conflicts=('lib32-nss')
provides=('lib32-nss')
makedepends=('gcc-multilib' 'perl')
options=('!strip' '!makeflags' staticlibs)
source=(https://ftp.mozilla.org/pub/security/nss/releases/NSS_${pkgver//./_}_RTM/src/${_pkgbasename}-${pkgver}.tar.gz
        nss.pc.in
        ssl-renegotiate-transitional.patch
        mozilla820740-chacha20.patch)
sha256sums=('5e38d4b9837ca338af966b97fc91c07f67ad647fb38dc4af3cfd0d84e477d15c'
            'b9f1428ca2305bf30b109507ff335fa00bce5a7ce0434b50acd26ad7c47dd5bd'
            '12df04bccbf674db1eef7a519a28987927b5e9c107b1dc386686f05e64f49a97'
            '15c244fc33b8e6647e004b6130fa5c85102e6099b8c5f2b597c817290f0618ab')

prepare() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}/

  # Adds transitional SSL renegotiate support - patch from Debian
  patch -Np3 -i "${srcdir}/ssl-renegotiate-transitional.patch"

  patch -Np1 -i "${srcdir}/mozilla820740-chacha20.patch"

  # Respect LDFLAGS
  sed -e 's/\$(MKSHLIB) -o/\$(MKSHLIB) \$(LDFLAGS) -o/' \
      -i nss/coreconf/rules.mk
}

build(){
  cd "${srcdir}"/${_pkgbasename}-${pkgver}/nss

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export BUILD_OPT=1
  export NSS_USE_SYSTEM_SQLITE=1
  export NSS_ENABLE_ECC=1
  export NSPR_INCLUDE_DIR="`nspr-config --includedir`"
  export NSPR_LIB_DIR="`nspr-config --libdir`"
  export XCFLAGS="${CFLAGS}"

  make -C coreconf
  make -C lib/dbm
  make
}

package() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}/nss
  install -d "$pkgdir"/usr/lib32/pkgconfig
 
  NSS_VMAJOR=$(grep '#define.*NSS_VMAJOR' nss/lib/nss/nss.h | awk '{print $3}')
  NSS_VMINOR=$(grep '#define.*NSS_VMINOR' nss/lib/nss/nss.h | awk '{print $3}')
  NSS_VPATCH=$(grep '#define.*NSS_VPATCH' nss/lib/nss/nss.h | awk '{print $3}')
 
  sed $srcdir/nss.pc.in \
    -e "s,%libdir%,/usr/lib32,g" \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,/usr/bin,g" \
    -e "s,%includedir%,/usr/include/nss,g" \
    -e "s,%NSPR_VERSION%,${_nsprver},g" \
    -e "s,%NSS_VERSION%,${pkgver},g" \
    > "$pkgdir/usr/lib32/pkgconfig/nss.pc"
  ln -s nss.pc "$pkgdir/usr/lib32/pkgconfig/mozilla-nss.pc"
 
 
  cd "${srcdir}"/${_pkgbasename}-${pkgver}/dist/*.OBJ/lib
  install -t "$pkgdir/usr/lib32" *.so
  install -t "$pkgdir/usr/lib32" -m644 libcrmf.a *.chk

  rm "$pkgdir/usr/lib32/libnssckbi.so"
}
