pkgname='perl-threads-aur'
pkgver='2.07'
pkgrel='1'
pkgdesc="Perl interpreter-based threads"
arch=('any')
url='https://metacpan.org/release/threads/'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
provides=(perl-threads=${pkgver})

source=("http://search.cpan.org/CPAN/authors/id/J/JD/JDHEDDEN/threads-$pkgver.tar.gz")
md5sums=('d0ef0ad1bb4304a1ff74af341a2b7373')

prepare() {
  export _src_dir="$srcdir/threads-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
