# Maintainer: gryffyn <aur at evan dot me>

_gemname=zpng
pkgname=ruby-$_gemname
pkgver=0.3.1
pkgrel=1
pkgdesc="pure ruby PNG file manipulation & validation"
arch=(any)
url='https://github.com/zed-0xff/zpng'
license=(MIT)
depends=('ruby' 'ruby-rainbow')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('e4c8760660af725353d3e9e1e77f88ae14f37ebb2b9bbc1d945de38ecf523e32')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
