# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Andy Kluger <https://t.me/andykluger>

_gemname=ansi
pkgname=ruby-$_gemname
pkgver=1.5.0
pkgrel=1
pkgdesc='ANSI at your fingertips!'
arch=(any)
url='http://rubyworks.github.com/ansi'
license=(BSD-2-Clause)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('fa9e40d63308b9ab61d1aca24dff3ec36581d619')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
