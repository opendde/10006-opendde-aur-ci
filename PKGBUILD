# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=ethon
pkgname=ruby-$_gemname
pkgver=0.9.0
pkgrel=1
pkgdesc='Libcurl wrapper.'
arch=(any)
url='https://github.com/typhoeus/ethon'
license=(MIT)
depends=('ruby' 'ruby-ffi')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha512sums=('5061977f6a94b5cf03f361844aea1be38436810fc88d1faa37f12d798050e55da30530d46cda295d7623d810c2286b5683b638077cf01c0b90127bb78b298868')
