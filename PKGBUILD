# Generated by Xyne::Arch::CPAN 0.07
# Edited by wtchappell <wtchappell@gmail.com>
# Maintainer: jose riha <jose1711 gmail com>

pkgname=perl-io-stty
pkgver=0.40.0
pkgrel=1
pkgdesc="lib/IO/Stty.pm"
arch=('any')
url="http://search.cpan.org/dist/IO-Stty/"
license=('PerlArtistic')
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/IO-Stty-0.04.tar.gz')
md5sums=('cb5f2f361ac46c2321ee071665cacc22')
sha256sums=('5c9509f1a8693d8287fa013def0bf87aa64cd927138461ef8deb55503c6651c2')
depends=('perl')
makedepends=('perl-module-build')
options=(!emptydirs)

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
    ./Build

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

}

package() {
echo "pkg starts here"
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    make install DESTDIR="${pkgdir}"

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    ./Build install destdir=${pkgdir}

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:set ts=2 sw=2 et:


