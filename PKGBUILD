# CPAN Name  : Test::Email
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-test-email
pkgver=0.04
pkgrel=1
pkgdesc='Perl package to test Email contents'
arch=('any')
url='http://search.cpan.org/dist/Test-Email'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.6.2' 'perl-mail-pop3client>=2' 'perl-mail-sendmail>=0.79' 'perl-mime-tools>=5.4')
source=(http://search.cpan.org/CPAN/authors/id/J/JA/JAMES/Test-Email-0.04.tar.gz)
options=(!emptydirs)
md5sums=('bb409977cffb292cd85d80d10506f59e')

build() {
	cd Test-Email-0.04
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Email-0.04
	make test
}

package() {
	cd Test-Email-0.04
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
