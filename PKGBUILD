# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=sawsge
pkgname=sawsge
pkgver=0.2.0
pkgrel=1
pkgdesc='Simple Markdown static site generator for blogs or projects'
arch=(any)
url='https://github.com/sawshep/sawsge'
license=(GPL3)
depends=(ruby ruby-tomlrb pandoc ruby-pandoc-ruby ruby-nokogiri)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('290b8dff7b140b7ce2136151cf7c626fc28125ccc453623ca18553154d5ad435')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
