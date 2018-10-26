# Maintainer: Jonne Haß <me@jhass.eu>

pkgname=ruby2.0-bundler
_gemname=${pkgname#ruby2.0-}
pkgver=1.17.1
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.0')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('cc9042aff791fb05dc037da8dc617bee3fb4d77d74c3d921c2f51c23f231b24a')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby-2.0 -rubygems -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem-2.0 install --no-user-install --ignore-dependencies \
    --no-ri --no-rdoc -i "$pkgdir/$_gemdir" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -d "$pkgdir/usr/bin/"
  ln -s "$_gemdir/bin/bundle" "$pkgdir/usr/bin/bundle-2.0"
}
