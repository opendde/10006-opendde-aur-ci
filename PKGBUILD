# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Daniel Wiesendorf <daniel.wiesendorf@googlemail.com>

_gemname=barr
pkgname=ruby-$_gemname
pkgver=0.2.3
pkgrel=1
pkgdesc='Barr is a status line generator for use with Lemonbar'
arch=(any)
url='https://github.com/OkayDave/barr'
license=(MIT)
depends=(ruby ruby-i3ipc ruby-weather-api)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('1f716f6d3fea91f6555a93b3b44a270a7205ebe7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
