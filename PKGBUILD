# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=octicons
pkgname=ruby-$_gemname-8
pkgver=8.5.0
pkgrel=1
pkgdesc="A package that distributes Octicons in a gem"
arch=(any)
url='https://github.com/primer/octicons'
license=(MIT)
depends=(ruby ruby-nokogiri)
provides=('ruby-octicons=8.5.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5ece8aa9bea4ce6073e190cdabc1a6b4b5ebd304')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
