# Maintainer : Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-system-command
pkgver=1.119
pkgrel=1
pkgdesc="Object for running system commands"
_dist=System-Command
arch=('any')
license=('PerlArtistic' 'GPL')
options=(purge '!emptydirs')
depends=(perl)
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz")
md5sums=('644de276a330ae2c51f47070397baf23')
sha256sums=('c8c9fb1e527c52463cab1476500efea70396a0b62bea625d2d6faea994dc46e7')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
