# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

_gemname=html-proofer
pkgname=ruby-$_gemname
pkgver=3.0.2
pkgrel=1
pkgdesc='A set of tests to validate your HTML output. These tests check if your image references are legitimate, if they have alt tags, if your internal links are working, and so on. It'\''s intended to be an all-in-one checker for your documentation output.'
arch=(any)
url='https://github.com/gjtorikian/html-proofer'
license=(MIT)
depends=(ruby ruby-mercenary ruby-nokogiri ruby-colored ruby-typhoeus-0 ruby-yell ruby-parallel ruby-addressable ruby-activesupport)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('66ae85ec941720fb8b6fdd9bc2774a68579e22e3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
