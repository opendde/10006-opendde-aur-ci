# $Id: PKGBUILD 135647 2015-06-21 02:57:30Z anatolik $
# Maintainer:
# Contributor: Firmicus <francois.archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=mod_perl
pkgver=2.0.9
pkgrel=3
pkgdesc='Apache module that embeds the Perl interpreter within the server'
arch=(i686 x86_64)
url='http://perl.apache.org/'
license=(APACHE)
depends=('perl<5.22' apache db apr-util perl-linux-pid)
options=(!emptydirs)
source=(http://apache.org/dist/perl/mod_perl-2.0.9.tar.gz{,.asc}
        undefined_symbol.patch::http://pkgs.fedoraproject.org/cgit/mod_perl.git/plain/mod_perl-2.0.4-inline.patch?h=f22)
validpgpkeys=(2026E6A4A6A4483E61BA6F3FAB34BA0040E92ECE)
sha256sums=('0260f26ab771c1c95fadc67544b3400e420bb30b8a77565d2d02ad05498ef52b'
            'SKIP'
            '08cd008e25d3eee44f477c744f50e574e2cb9853556d268ba06e8b3cb33341e4')

prepare() {
  cd mod_perl-$pkgver
  # FS#45392
  patch -p1 < ../undefined_symbol.patch
}

build() {
  cd mod_perl-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor MP_APXS=/usr/bin/apxs
  make
}

check() {
  cd mod_perl-$pkgver
  # tests are very flaky
  # make test
}

package() {
  cd mod_perl-$pkgver
  make install DESTDIR="$pkgdir"
}
