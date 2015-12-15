# Maintainer: Jonne Haß <me@jhass.eu>

pkgname=ruby2.0-bundler
_gemname=${pkgname#ruby2.0-}
pkgver=1.11.1
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.0')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('7ffed4f74a3f9b9222be04a3d3640443e235173887394176884269a4ea16cc96')

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
