# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

_gemname=metaclass
pkgname=ruby-$_gemname
pkgver=0.0.4
pkgrel=1
pkgdesc='Adds a metaclass method to all Ruby objects'
arch=(any)
url='http://github.com/floehopper/metaclass'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('1c260bcb24bcf0867ca9d601a0b64d45d36e4a30')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}
