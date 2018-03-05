# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-data-guid
pkgver=0.049
pkgrel=1
_author="R/RJ/RJBS"
_perlmod="Data-GUID"
pkgdesc="Data::GUID - globally unique identifiers"
arch=('any')
url="http://search.cpan.org/dist/Data-GUID/"
license=('GPL' 'PerlArtistic')
depends=(
perl-data-uuid
perl-sub-exporter
perl-sub-install
)
makedepends=(
perl-data-uuid
perl-sub-exporter
perl-sub-install
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('b8af437d49fd0425a23ebff3e5989dae64deeaf0e046aa5f413665cd3169a77b')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  if [ -f Makefile.PL ]; then
    perl Makefile.PL
    make
  else
    perl Build.PL
    ./Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  if [ -f Makefile.PL ]; then
    make test
  else
    ./Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  if [ -f Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  else
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}
