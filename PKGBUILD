# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>
# Contributor: kulpae <my.shando@googlemail.com>

_gemname=json_pure
pkgname=ruby-$_gemname
pkgver=2.5.1
pkgrel=1
pkgdesc='JSON Implementation for Ruby'
arch=(any)
url='http://flori.github.com/json'
license=(RUBY)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('271ccd98ae9db6cbc6223df5a374ad529dc11e39')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
