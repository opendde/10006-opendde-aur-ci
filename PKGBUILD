# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Zinc Chen <zinc.chen@live.cn>

pkgname=perl-net-interface
_cpanname=Net-Interface
pkgver=1.012
pkgrel=7
pkgdesc="Net::Interface - Perl extension to access network interfaces    "
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
makedepends=('perl-extutils-depends' 'perl-module-install')
source=("http://cpan.metacpan.org/authors/id/M/MI/MIKER/${_cpanname}-${pkgver}.tar.gz"
	'inc.patch')
md5sums=('cfa0c390c506996c004fb5b214fc4a7c')

build() {
  cd ${_cpanname}-${pkgver}
  patch -Np2 -b -z .orig <../inc.patch
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd ${_cpanname}-${pkgver}
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
  _perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
  _perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
  depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}


md5sums=('cfa0c390c506996c004fb5b214fc4a7c'
         '3240db69ec69d45d4a9f768171f6f24e')
