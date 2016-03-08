# Maintainer: Harm Müller <harm[DOT]mueller[AT]gmail[DOT]com>
pkgname='perl-rex'
pkgver='1.4.0'
pkgrel='1'
pkgdesc="(R)?ex Deployment & Configuration Management"
arch=('any')
license=('Apache')
options=('!emptydirs')
depends=('perl-hash-merge' 'perl-net-ssh2' 'perl-libwww' 'perl-io-string' 'perl-json-xs' 'perl-list-allutils' 'perl-sort-naturally' 'perl-term-readkey' 'perl-text-glob' 'perl-xml-simple' 'perl-yaml' 'perl-net-openssh' 'perl-test-useallmodules' 'perl-io-tty' 'perl-net-sftp-foreign' 'perl-test-pod' 'perl-string-escape' 'perl-test-deep' 'perl-devel-caller' 'perl-padwalker')
makedepends=()
url='http://www.rexify.org/'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERKI/Rex-1.4.0.tar.gz')
md5sums=('46b888f022144354adff15d986c1e20b')
sha256sums=('b4f930044ea907aae67c18f347a33b55cd3da4efe5f5a5869db3c891d6c4e125')
_distdir="Rex-1.4.0"

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
