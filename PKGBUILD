# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-coro
_realname=Coro
pkgver=6.511
pkgrel=2
pkgdesc="CPAN/Coro - the only real threads in perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=5' 'perl-common-sense' 'perl-guard>=0.5')
makedepends=('perl-canary-stability')
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz"
        "https://rt.cpan.org/Ticket/Attachment/1672349/897490/coro-5.24.patch")
md5sums=('bcad7051f573fed680eaf72e64e2140e'
         '9652ac25655d99f0a798e3d9b98d6747')

prepare() {
  cd $_realname-$pkgver
  patch -Np1 -b -z .orig < ../coro-5.24.patch
}

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make PERL_MM_USE_DEFAULT=1
}

check() {
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 test
}

package() {
  cd $_realname-$pkgver
  make PERL_MM_USE_DEFAULT=1 DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

# vim:set ts=2 sw=2 et:
