# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=uglifier
pkgname=ruby-$_gemname
pkgver=2.7.1
pkgrel=1
pkgdesc='Ruby wrapper for UglifyJS JavaScript compressor'
arch=(any)
url='http://github.com/lautis/uglifier'
license=(MIT)
depends=(ruby ruby-execjs ruby-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('36725b6b60d0a57160d623604a05d89414bf5c9b5eb0a2d58282dd6b62e34c012d7c25af32f1ea748091000f92a478ff87e228f7eb7e1947eafcd3bb2b4bfd59')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
