# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: kusakata <shohei atmark kusakata period com>

_gemname=ruby-rc4
pkgname=ruby-$_gemname
pkgver=0.1.5
pkgrel=2
pkgdesc='RubyRC4 is a pure Ruby implementation of the RC4 algorithm.'
arch=('any')
url='https://github.com/caiges/Ruby-RC4'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('00cc40a39d20b53f5459e7ea006a92cf584e9bc275e2a6f7aa1515510e896c03')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
