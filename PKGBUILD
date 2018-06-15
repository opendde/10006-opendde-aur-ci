# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-geoip2
pkgver=1.0
pkgrel=3
pkgdesc="MaxMind GeoIP v2 databases reader"
arch=('any')
depends=('geoip2-database' 'perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/bbkr/GeoIP2"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/bbkr/GeoIP2)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
