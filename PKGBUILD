# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Carsten Haitzler (Rasterman)
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=elementary-git
_pkgname=${pkgname%-*}
true && pkgname=('elementary-git' 'elementary_test-git')
pkgver=1.7.99.8168.9401c89
pkgrel=1
pkgdesc="Enlightenment GUI toolkit - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1' 'CCPL:cc-by-sa')
depends=('efl-git')
  [[ $(pacman -T ewebkit-svn) ]] || depends+=('ewebkit-svn')
  [[ $(pacman -T elocation-git) ]] || depends+=('elocation-git')
  [[ $(pacman -T libeweather-git) ]] || depends+=('libeweather-git')
makedepends=('git')
options=('!libtool' 'debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done
  
  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package_elementary-git() {
  provides=("${pkgname%-*}=$pkgver")
  conflicts=("${pkgname%-*}")

  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
  
# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COMPLIANCE "$pkgdir/usr/share/licenses/$pkgname/COMPLIANCE"
  sed -n '1,/details./p' COPYING > "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING.images "$pkgdir/usr/share/licenses/$pkgname/COPYING.images"

# remove test app
  rm -rf "$pkgdir/usr/bin/"elementary_test*
  rm -rf "$pkgdir/usr/lib/elementary/modules/"{test_entry,test_map}
  rm -rf "$pkgdir/usr/lib/elementary_testql.so"
  rm -rf "$pkgdir/usr/share/applications/elementary_test.desktop"
  rm -rf "$pkgdir/usr/share/elementary/"{examples,images,objects}
}

package_elementary_test-git() {
  true && pkgdesc="Test application for Elementary"
  true && depends=('elementary')
  provides=("${pkgname%-*}=$pkgver")
  conflicts=("${pkgname%-*}")

  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# remove elementary
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/bin/"{elementary_codegen,elementary_config,elementary_quicklaunch,elementary_run,elm_prefs_cc}
  rm -rf "$pkgdir/usr/lib/"{cmake,edje,elementary,libelementary.so*,pkgconfig}
  rm -rf "$pkgdir/usr/share/applications/elementary_config.desktop"
  rm -rf "$pkgdir/usr/share/elementary/"{config,examples,themes,edje_externals}
  rm -rf "$pkgdir/usr/share/"{icons,locale}
}
