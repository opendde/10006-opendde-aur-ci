# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=prawn-svg
pkgname=ruby-$_gemname
pkgver=0.32.0
pkgrel=2
pkgdesc='SVG renderer for Prawn PDF library'
arch=(any)
url='http://github.com/mogest/prawn-svg'
license=(MIT)
depends=(ruby ruby-prawn ruby-css_parser ruby-rexml)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('82f927a3309c254ad90c4d6bf6913adeea615807')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
