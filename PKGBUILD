# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=activemodel
pkgname=ruby-$_gemname
pkgver=4.2.5.1
pkgrel=1
pkgdesc='A toolkit for building modeling frameworks (part of Rails).'
arch=(any)
url='http://www.rubyonrails.org'
license=(MIT)
depends=(ruby ruby-activesupport ruby-builder)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('1a845d38be3add3d52006d0b81a7e5ef28160c30')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
