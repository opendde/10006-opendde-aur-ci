# Maintainer: Vojtech Aschenbrenner <v@asch.cz>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=2.0.0
pkgrel=1
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://rubygems.org/gems/highline"
license=('GPL2' 'RUBY')
makedepends=('ruby-rdoc')
depends=('ruby')
options=(!emptydirs)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('74524686caf43dd56465ba847bd2c33b552028cf23973c4f1fbb5e5971f93a19')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
