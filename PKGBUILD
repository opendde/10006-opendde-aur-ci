# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Generated by gem2arch

_gemname=vmail
pkgname=$_gemname
pkgver=2.9.9
pkgrel=1
pkgdesc="A Vim interface to Gmail"
arch=('any')
url="http://danielchoi.com/software/vmail.html"
license=('')
depends=('ruby' 'ruby-mail' 'ruby-highline' 'ruby-sequel' 'ruby-versionomy' 'ruby-sqlite3')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('f772c8bf9d3f91bbe5fa776d3a8853de')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
