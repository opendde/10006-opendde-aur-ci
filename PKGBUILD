# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rsvg2
pkgname=ruby-$_gemname
pkgver=2.2.5
pkgrel=1
pkgdesc='Ruby/RSVG is a Ruby binding of librsvg-2.x.'
arch=(i686 x86_64)
url='http://ruby-gnome2.sourceforge.jp/'
license=('LGPLv2.1 or later')
depends=(ruby ruby-cairo ruby-gdk_pixbuf2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('bb5c11ed29b53adf8883841ea4fa8eec07fc6fe41c303becfef29dcccf4ee89582fdaec5918a497eb1dc381c3b8f60443ba7fd5020310114faa4a425d5ff4f41')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
