# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rb-fsevent
pkgname=ruby-$_gemname
pkgver=0.9.6
pkgrel=1
pkgdesc='Very simple & usable FSEvents API'
arch=('any')
url='http://rubygems.org/gems/rb-fsevent'
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('420695d066994e2723931d0410a8dde7b50e60b43ecd8bbe8c604724fc3a05c3')
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir"/cache/$_gemname-$pkgver.gem
  install -Dm0644 "$pkgdir/$_gemdir"/gems/$_gemname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
