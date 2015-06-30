# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-json-any'
pkgver='1.39'
pkgrel='1'
pkgdesc="Wrapper Class for the various JSON classes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.02' 'perl-json-xs>=2.3' 'perl-yaml-syck' 'perl-namespace-clean')
makedepends=('perl-test-fatal' 'perl-test-requires' 'perl-test-warnings>=0.009' 'perl-test-without-module')
url='http://search.cpan.org/dist/JSON-Any'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/JSON-Any-${pkgver}.tar.gz")
md5sums=('5d353625730e8a995bdee29560a2159b')
sha512sums=('a4e9494ef650fe6f0144fddad49962e717470390b5783ab7bed6ef1c34fa7aa3d4f8699b9967ec8ca8813f43ee8c1d594e5af4d4962929791aa95b470104cd9b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/JSON-Any-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
