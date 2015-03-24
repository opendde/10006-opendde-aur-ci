# CPAN Name  : Path::Tiny
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-path-tiny
pkgver=0.068
pkgrel=1
pkgdesc='A small and fast Perl module for working with file paths'
arch=('any')
url='https://metacpan.org/release/Path-Tiny'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.17.8')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.068.tar.gz)
options=(!emptydirs)
md5sums=('76e99fd1bb615f56954025ae636c6233')

build() {
	cd Path-Tiny-0.068
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Path-Tiny-0.068
	make test
}

package() {
	cd Path-Tiny-0.068
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
