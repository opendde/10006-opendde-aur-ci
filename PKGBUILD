# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=distcc-git
_pkgname=distcc
pkgver=v3.3.3.r33.g10addba
pkgrel=1
pkgdesc='Distributed C, C++ and Objective-C compiler, git version'
arch=('x86_64')
url='http://distcc.org'
license=(GPL)
depends=(avahi popt python)
makedepends=(git gtk2 setconf)
optdepends=('gtk2: for distccmon-gnome')
conflicts=(distcc)
provides=(distcc)
backup=('etc/conf.d/distccd'
        'etc/distcc/hosts')
source=("git://github.com/distcc/distcc.git"
        'distccd.conf.d'
        'distccd.service'
        'sysusers.conf')
b2sums=('SKIP'
        'c48a6daea2cae5e5865c488e612c819e6f9bf4a1b205e2cd264b795de3450d40b0fe05264fbd8a3fe861f03e38d91e7e791ad67e22da5b5d0b43bcb380b8b4c9'
        '9b6ffc02e9360fd92f7595e96ef2d69b5f6d72acf343009375fa081f86b26f51960b139c4f6e0e3c8befa37eba4894d61351bbfab6386389c262db0cc01a8b8e'
        'd1b057ce49994ac61e9d5a861c1c770452102300d47a9c396b3272d7f5afbd3fe3e865e6db11c046e73ae3b6886bc8970a10624650731d55132362436904f989')
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  ./autogen.sh
  setconf gnome/distccmon-gnome.desktop Name 'DistCC Monitor'
  sed -i 's/ install-gnome-data//g' Makefile.in

  # FS#66418, support Python 3.9
  find . -name "*.py" -type f -exec sed -i 's/time.clock()/time.perf_counter()/g' {} \;
}

build() {
  cd "$_pkgname"

  ./configure \
    --prefix=/usr \
    --enable-rfc2553 \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-gtk
  make WERROR_CFLAGS= INCLUDESERVER_PYTHON=/usr/bin/python
}

package() {
  make -C "$_pkgname" \
    DESTDIR="$pkgdir" \
    INCLUDESERVER_PYTHON=/usr/bin/python \
    install

  # Configuration
  install -Dm644 distccd.conf.d "$pkgdir/etc/conf.d/distccd"
  install -Dm644 distccd.service \
    "$pkgdir/usr/lib/systemd/system/distccd.service"

  # Desktop shortcut
  install -Dm644 "$srcdir/distcc/gnome/distccmon-gnome.png" \
    "$pkgdir/usr/share/pixmaps/distccmon-gnome-icon.png"
  install -Dm644 "$srcdir/distcc/gnome/distccmon-gnome.desktop" \
    "$pkgdir/usr/share/applications/distccmon-gnome.desktop"

  # Symlinks
  _targets=(c++ c89 c99 cc clang clang++ cpp g++ gcc x86_64-pc-linux-gnu-g++
            x86_64-pc-linux-gnu-gcc x86_64-pc-linux-gnu-gcc-10.1.0)
  install -d "$pkgdir/usr/lib/$_pkgname/bin"
  for bin in "${_targets[@]}"; do
    # For whitelist since version 3.3, see FS#57978
    ln -sf "../../bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$bin"
    # Needed for makepkg to work
    ln -sf "../../../bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/bin/$bin"
  done

 # FS#67629
 install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/distccd.conf"
}

# getver: distcc.org
# vim: ts=2 sw=2 et:
