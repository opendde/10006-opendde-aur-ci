# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: mehalter <micah at mehalter.com>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=rails
pkgname=ruby-$_gemname
pkgver=6.1.1
pkgrel=1
pkgdesc='Full-stack web application framework.'
arch=(any)
url='http://www.rubyonrails.org'
license=(MIT)
depends=(ruby ruby-activesupport ruby-actionpack ruby-actionview ruby-activemodel \
         ruby-activerecord ruby-actionmailer ruby-railties ruby-bundler \
         ruby-sprockets-rails)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b7710f82e68af72db1ffa30ff3d67437e8fb91c26255659f3c2602964b834a64')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install -no-documentation --ignore-dependencies --no-user-install \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
