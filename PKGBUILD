# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>
# Contributor: Grey Christoforo <grey@christoforo.net>

_gemname=gemojione
pkgname=ruby-$_gemname
pkgver=4.3.3
pkgrel=1
pkgdesc='A gem for EmojiOne'
arch=(any)
url='http://github.com/jonathanwiesel/gemojione'
license=('MIT')
depends=(ruby ruby-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c64756133979460a702dea14908729f9178ee1ca')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
