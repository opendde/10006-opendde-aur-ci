# Maintainer: outopos <spaceflorent at aol.com>

pkgname=perl-net-freedb
pkgver=0.10
pkgrel=1
pkgdesc='Net::FreeDB is an oo-based module to interface with FreeDB servers'
_dist=Net-FreeDB
arch=('any')
url="https://metacpan.org/release/Net-FreeDB"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-http-message' 'perl-mailtools' 'perl-libwww' 'perl-moo' 'perl-cddb' 'perl-cddb-file' 'perl-io-socket-inet6' 'perl-test-most')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/D/DS/DSHULTZ/$_dist-$pkgver.tar.gz")
md5sums=('e10ac95e23b146a90bd9f0a84e31d18f')
sha512sums=('b1b249dfb81128645e6e3481f93d914fc11ecf931b91f6a21a065fa2fde8674f9c8b5466b3112be4f4f28556c0ec899cf8723e60adaaf26b5165e61d61445368')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
