# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=railties
pkgname=ruby-$_gemname
pkgver=4.2.1
pkgrel=1
pkgdesc='Tools for creating, working with, and running Rails applications.'
arch=(any)
url='http://www.rubyonrails.org'
license=(MIT)
depends=(ruby ruby-activesupport ruby-actionpack ruby-thor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c2646b293b0ce541012a449d5eeeb4a0c7941f66')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
