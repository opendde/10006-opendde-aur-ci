# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@gmail.com>

_gemname=minitest
pkgname=ruby-$_gemname-5
pkgver=5.9.0
pkgrel=1
pkgdesc='minitest provides a complete suite of testing facilities supporting TDD, BDD, mocking, and benchmarking'
arch=(any)
url='https://github.com/seattlerb/minitest'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('dd295c2cb4bca1f2c9157072cfd0494ce39dfd15')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
