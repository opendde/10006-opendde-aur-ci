# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: AUR Perl <aurperl@juster.info>

pkgname=perl-task-weaken
_cpanname="Task-Weaken"
pkgver=1.05
pkgrel=1
pkgdesc="Ensure that a platform has weaken support"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.5.0')
url="http://search.cpan.org/dist/$_cpanname"
#source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/$_cpanname-$pkgver.tar.gz")
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/$_cpanname-$pkgver.tar.gz")
sha256sums=('85f3bf738d0e94f935d9efd83575a2afd0aafb66adcc6624cee5064146f6b95c')

# Function to change to the working directory and set
# environment variables to override undesired options.
prepareEnvironment() {
	cd "$srcdir/$_cpanname-$pkgver"
	export \
		PERL_MM_USE_DEFAULT=1 \
		PERL_AUTOINSTALL=--skipdeps \
		PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null
}

build() {
	prepareEnvironment
	/usr/bin/perl Makefile.PL
	make
}

check() {
	prepareEnvironment
	make test
}

package() {
	prepareEnvironment
	make install

	# Remove "perllocal.pod" and ".packlist".
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
