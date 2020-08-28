# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_pkgbasename=libx11-threadsafe
pkgname=lib32-$_pkgbasename
pkgver=1.6.12
pkgrel=1
pkgdesc="X11 client-side library (32-bit) - threadsafe patches by Jacek Caban"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
# keep xorgproto runtime dependency
# https://lists.archlinux.org/pipermail/arch-dev-public/2019-December/029767.html
depends=('lib32-libxcb' 'xorgproto' $_pkgbasename)
makedepends=('xorg-util-macros' 'xtrans' 'gcc-multilib')
provides=("lib32-libx11=${pkgver}")
conflicts=("lib32-libx11=${pkgver}")
license=('custom:XFREE86')
source=(${url}/releases/individual/lib/libX11-${pkgver}.tar.bz2{,.sig}
        0001-Fix-poll_for_response-race-condition.patch
        threadsafe.patch)
sha512sums=('79df7d61d9009b0dd3b65f67a62189aa0a43799c01026b3d2d534092596a0b67f246af5e398a89eb1ccc61a27335f81be8262b8a39768a76f62d862cd7415a47'
            'SKIP'
            '8e45cf24ee3eaa735d79cfe768b87917be86ada8ae8688f44e1d914c52ac39be9815986432893d73b5c931ac2dd9a849d47bf2b2063b440f57a67c7d9ca5cc1f'
            '625e747ddbbd6d84d9198199ecb9d93aad4e39c2b20b618bb2cc283c4c5aa3dd83bc80d45b002b612ffff2c70bf8d7cf1d07152097221b0c144a6cc06e0f5d63')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>
validpgpkeys+=('C41C985FDCF1E5364576638B687393EE37D128F8') # Matthieu Herrb <matthieu.herrb@laas.fr>
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
validpgpkeys+=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # Adam Jackson <ajax@nwnk.net>

prepare() {
  cd "libX11-${pkgver}"
  patch -Np1 <../0001-Fix-poll_for_response-race-condition.patch
  patch -Np1 <../threadsafe.patch
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "libX11-${pkgver}"
  ./configure --prefix=/usr --disable-static --disable-xf86bigfont \
      --libdir=/usr/lib32 --disable-specs
  make
}

check() {
  cd "libX11-${pkgver}"
  make check
}

package() {
  cd "libX11-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
