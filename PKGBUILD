# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_gemname=mixlib-cli
pkgname=ruby-$_gemname
pkgver=1.7.0
pkgrel=1
pkgdesc='A simple mixin for CLI interfaces, including option parsing'
arch=(any)
url='https://www.chef.io'
license=(Apache-2.0)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('a8b3754e3f866a713941e848cee87425e1d1f81b')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
