# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-session-driver-memcached'
pkgver='0.04'
pkgrel='1'
pkgdesc="Perl/CPAN Module CGI::Session::Driver::memcached: Persistent session data in CGI applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-session>=4', 'perl-cache-memcached')
# Cache::Memcached::Fast seems to be broken right now.
#optdepends=(
#  'perl-cache-memcached-fast: perl-cache-memcached alternative'
#)
makedepends=()
#checkdepends=('memcached')
url='https://metacpan.org/release/CGI-Session-Driver-memcached'
source=("http://search.cpan.org/CPAN/authors/id/O/OI/OINUME/CGI-Session-Driver-memcached-$pkgver.tar.gz")
md5sums=('9e2e241282c5f7e9bc5b263fc0368698')
sha512sums=('22ddf091e5dca8367bf0c336c5f8178762b62ee061fe72dc02725726bab04232765337de65019ec9986c735d9a6a48cab77161e3ddc93832acf9cd9d4d929378')
_distdir="CGI-Session-Driver-memcached-$pkgver"

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
  # TODO: Start memcached if it is not already running
  # and when started, stop it after testing.
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
