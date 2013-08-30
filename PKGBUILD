# CPAN Name  : Email::Folder
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-email-folder
pkgver=0.857
pkgrel=1
pkgdesc='Perl module to read all messages from a folder as Email::Simple objects'
arch=('any')
url='http://search.cpan.org/dist/Email-Folder'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.13.4' 'perl-email-foldertype>=0.6' 'perl-email-simple')
checkdepends=('perl-capture-tiny')
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Folder-0.857.tar.gz)
options=(!emptydirs)
md5sums=('a7be2a3cb9353a1c9f7c5f83405f07d8')

build() {
  cd Email-Folder-0.857
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Email-Folder-0.857
  make test
}

package() {
  cd Email-Folder-0.857
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
