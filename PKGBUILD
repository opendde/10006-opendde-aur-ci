# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: courk <courk at courk dot fr>

_gemname=kaitai-struct-visualizer
pkgname=$_gemname
pkgver=0.7
pkgrel=1
pkgdesc='Advanced hex viewer and binary structure exploration tool (visualizer) using Kaitai Struct ksy files'
arch=(any)
url='http://kaitai.io'
license=(GPL-3.0+)
depends=(ruby ruby-rdoc kaitai-struct-compiler ruby-kaitai-struct)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0349d7cb1ff9dbfa0652a52554d17bb8945f3c7d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
