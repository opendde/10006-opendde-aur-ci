# Maintainer : René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-curl'
pkgver='0.43'
pkgrel='1'
pkgdesc="Perl interface for libcurl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('curl>=7.37.0' 'perl')
makedepends=('gcc')
url='http://search.mcpan.org/dist/Net-Curl'
source=('http://search.mcpan.org/CPAN/authors/id/S/SY/SYP/Net-Curl-0.43.tar.gz')
sha256sums=('8bf55332d1fb9288034537fa682e1058affbf7269819fa62ef9e032328dc93b6')
_distdir="Net-Curl-0.43"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
