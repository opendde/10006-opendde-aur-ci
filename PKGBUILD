# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: a-wing <1@233.email>

_gemname=websocket-extensions
pkgname=ruby-$_gemname
pkgver=0.1.3
pkgrel=1
pkgdesc='Generic extension manager for WebSocket connections'
arch=(any)
url='https://github.com/faye/websocket-extensions-ruby'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e3ec3cdccf56d8649c47e92820e05d7e7b635c23')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
