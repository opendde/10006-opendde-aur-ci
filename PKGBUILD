# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: farawayer <farwayer@gmail.com>

_gemname=json
pkgname=ruby-$_gemname-1
pkgver=1.8.3
pkgrel=2
pkgdesc='JSON Implementation for Ruby'
arch=(i686 x86_64)
url='http://flori.github.com/json'
license=(Ruby)
provides=("ruby-json=$pkgver")
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('dcd00a477bbb8c0c722f68f9c28bc8460a7b1d6f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING-json-jruby" "$pkgdir/usr/share/licenses/$pkgname/COPYING-json-jruby"
}
