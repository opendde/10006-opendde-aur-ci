# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma-plugin-sendkey
pkgname=ruby-$_gemname
pkgver=0.5.1
pkgrel=3
pkgdesc="Fusuma plugin that sending virtual keyboard events."
arch=(any)
url="https://github.com/iberianpig/fusuma-plugin-sendkey"
license=(MIT)
depends=(ruby ruby-fusuma ruby-revdev)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5d5ce7320f7a6b502080e420e44dda6aca001ab5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
