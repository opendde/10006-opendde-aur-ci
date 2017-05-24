# Maintainer: uleenucks <dev@uleenucks.de>
pkgname=dwm-uleenucks-git
_pkgname=dwm
pkgdesc="dwm with uleenucks personalisations"
pkgver=6.1.18.gceac8c9
pkgver(){
  cd $_pkgname
  git describe --tags |sed 's/-/./g'
}
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
install=dwm.install
provides=('dwm')
conflicts=('dwm')
replaces=('dwm')
epoch=1
source=("$_pkgname::git+http://git.suckless.org/dwm"
        config.def.h.x200s
        config.def.h.work
        compile.sh
        dwm-6.1-center.diff)

sha512sums=('SKIP'
            'a6382c513e70cf441474acbad777bb57c9dd76306ac671309e2497ffb024849d0df511cb5956e4d2fbac3c169a590a2eeef5e43f2be4741aa43caf068e06c0e7'
            '3699c8b4e7bf2e9d60347d3ac5a987cd6302af8d0292767776735916aeb864264cf8e2125c6d5c13e5a8039b5e7bc3601f93fb709e63782717bd34c811e14f60'
            '604088406fbed682c2e8bec9085d0f9e302088a95ba60dfd89aad2444a53c3025c7aa956789732e7a58aeb937d265f8c66784ce2c77e8a1db533369722ee7fbb'
            '383a79385d6444ff503d1a81ed13a52db06d253857a8ee955ab0ef669df6e6da501cc0e35a2549472f271684de13de3a3fb2d6843cd596842f9fbc0e0ad53d66')

prepare() {
  if [[ -f $SRCDEST/config.def.h ]]; then
    ln -sf $SRCDEST/config.def.h $srcdir/dwm/config.h
  fi
}

build() {
  cd $_pkgname

  patch -p1 < ../dwm-6.1-center.diff || exit 1
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  make -C $_pkgname PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D $_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D $_pkgname/README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
