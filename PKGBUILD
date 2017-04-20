# Maintainer: 3ED <krzysztofas at protonmail dot com>
#
pkgname=perl-www-offliberty
_author=MGV
_pkgname=WWW-Offliberty
pkgver=1.000004
pkgrel=1
pkgdesc="a simple interface to the offliberty.com download service"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree')
checkdepends=('perl-test-requiresinternet')
makedepends=('perl-extutils-makemaker')
url="https://metacpan.org/release/${_pkgname}"

_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('b6b81527fee410553b8b4a044d47cb454d020438f829ca3773865be0a9c0fc8f')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

