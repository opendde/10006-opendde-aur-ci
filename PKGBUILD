# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>

_gemname=pgdexter
pkgname=ruby-$_gemname
pkgver=0.3.5
pkgrel=1
pkgdesc='The automatic indexer for Postgres'
arch=(any)
url='https://github.com/ankane/dexter'
license=()
depends=(ruby ruby-slop ruby-pg ruby-pg_query)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('6fa4f7eb6a64647ad1351ff96d556caf31720c33f35aba4bcf683bfd51d9db55')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
