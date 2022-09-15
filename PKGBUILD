# Maintainer: Einar Lielmanis <einar@spicausis.lv>

pkgname=sylpheed-beta-iconmod
pkgver=3.8.0beta1
pkgrel=1
pkgdesc="Lightweight e-mail client. Latest official beta with the coonsden.com icon theme."
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('gpgme' 'gtk2' 'compface' 'gtkspell')
options=('libtool')
conflicts=('sylpheed' 'sylpheed-beta')
provides=('sylpheed')
source=(http://sylpheed.sraoss.jp/sylpheed/v3.8beta/sylpheed-$pkgver.tar.bz2{,.asc}
        ssl-sni-support.patch
        Sylpheed3.0_icon-set.tar.gz)

build() {

  #cp -r "$srcdir/Sylpheed3.0_icon-set/src" "$srcdir/sylpheed-3.5.1"
  #cd "$srcdir/sylpheed-3.5.1"

  cp -r "$srcdir/Sylpheed3.0_icon-set/src" "$srcdir/sylpheed-$pkgver"
  cd "$srcdir/sylpheed-$pkgver"

  # fix enchant maintainers moving things around for fun
  sed -i 's:enchant/enchant.h:enchant-2/enchant.h:g' src/compose.c
  sed -i 's:PKG_CONFIG --libs enchant:PKG_CONFIG --libs enchant-2:g' configure.ac

  patch -p1 < "$srcdir/ssl-sni-support.patch"

  autoconf
  ./configure --prefix=/usr --enable-ldap --enable-gpgme
  make
}

package() {
  #cd "$srcdir/sylpheed-3.5.1"
  cd "$srcdir/sylpheed-$pkgver"
  make DESTDIR="$pkgdir" install
}

validpgpkeys=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26')

md5sums=('7496ab4614695831f9d041e4ed7ab23e'
         'SKIP'
         'b05b75bb2bd46d4022f920e09e0b1923'
         'f0fa7317216cf4f159f1cd1edfa1af39')
