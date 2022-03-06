# Contributor: Jürgen Hötzel <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bigloo-devel
pkgver=4.4c
pkgrel=12
epoch=1
_suffix=latest
pkgdesc="Fast scheme compiler"
arch=('x86_64')
url="https://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('gmp' 'openssl' 'libunistring' 'libnsl' 'gc' 'libuv' 'libpulse' 'mpg123' 'avahi' 'sqlite')
makedepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi' 'chrpath' 'tar')
optdepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi')
options=('!makeflags' 'staticlibs')
conflicts=('bigloo')
provides=("bigloo=$pkgver")
source=(ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${pkgname%-devel}-${_suffix}.tar.gz bigloo-emacs.patch)
sha256sums=('b2335635f61a4c9a40ada1df79f7bd5fc2b497a2f0f6117fd321a6d06f36c045'
            '80356c27b58a302775f75e848a89ab2d588796a548f4ce7a20df048e215deab0')

prepare() {
  patch -p0 -d "${srcdir}/${pkgname%-devel}-$_suffix" -i "${srcdir}/bigloo-emacs.patch"
}

build() {
  cd ${pkgname%-devel}-$_suffix
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/bigloo \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --lispdir=${elisp_dir} \
    --coflags="$CFLAGS" \
    --cpicflags="-fPIC" \
    --customgc=no \
    --customgmp=no \
    --customlibuv=no \
    --customunistring=no \
    --jvm=no \
    --native-default-backend \
    --enable-avahi \
    --enable-flac \
    --enable-sqlite \
    --enable-ssl \
    --disable-gstreamer
  sed -i '80d' Makefile.config
  EXTRALIBS="-ldl -lresolv -lunistring -lpcre -lgmp -lm -lc" make build compile-bee
}

check() {
  cd ${pkgname%-devel}-$_suffix
  make test
}

package() {
  cd ${pkgname%-devel}-$_suffix

  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee

  rm "${pkgdir}"/usr/bin/{bglafile,bigloo}.sh
}
