# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=solargraph
pkgname=ruby-solargraph
pkgver=0.47.2
pkgrel=1
pkgdesc="A Ruby language server"
arch=("any")
depends=(
  ruby
  ruby-backport
  ruby-bundler
  ruby-e2mmap
  ruby-jaro_winkler
  ruby-kramdown
  ruby-kramdown-parser-gfm
  ruby-parser
  ruby-reverse_markdown
  ruby-rubocop
  ruby-thor
  ruby-tilt
  ruby-yard
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("87ca4b799b9155c2c31c15954c483e952fdacd800f52d6709b901dd447bcac6a")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
