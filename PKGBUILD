# CPAN Name  : Path::Tiny
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-path-tiny
pkgver=0.031
pkgrel=1
pkgdesc='A small and fast Perl module for working with file paths'
arch=('any')
url='http://search.cpan.org/dist/Path-Tiny'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-pathtools>=3.40' 'perl-autodie>=2.14' 'perl-digest>=1.03' 'perl-digest-sha>=5.45')
checkdepends=('perl>=5.13.4' 'perl-capture-tiny' 'perl-devel-hide' 'perl-file-pushd' 'perl-test-deep'
	'perl-test-fatal' 'perl-test-failwarnings')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.031.tar.gz)
options=(!emptydirs)
md5sums=('520141e371439d4467232f87f2f1681b')

build() {
  cd Path-Tiny-0.031
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Path-Tiny-0.031
  make test
}

package() {
  cd Path-Tiny-0.031
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
