# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Jonne Haß <me@jhass.eu>

_gemname=acme-client
pkgname=ruby-$_gemname
pkgver=2.0.8
pkgrel=1
pkgdesc='Client for the ACME protocol.'
arch=(any)
url='http://github.com/unixcharles/acme-client'
license=(MIT)
depends=(ruby ruby-faraday)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('ae47f224946e5d3975c4092c6f72b90aed83872e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
