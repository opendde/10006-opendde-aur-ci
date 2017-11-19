# Contributor: Luca Cesari < luca AT cesari DOT me>
_gemname=xdg
pkgname=ruby-xdg
pkgver=2.2.3
pkgrel=1
pkgdesc="XDG provides a module for supporting the XDG Base Directory Standard"
arch=(any)
url="https://github.com/rubyworks/xdg"
license=('BSD')
depends=(ruby)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/xdg-$pkgver.gem)
noextract=(xdg-$pkgver.gem)
md5sums=('889498527b5e08fb080503614cee29ef')

package() {
    cd $srcdir
    export HOME='/tmp'
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    install -d -m 755 ${pkgdir}/usr/bin
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n ${pkgdir}/usr/bin ${_gemname}-${pkgver}.gem

    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim:set ts=2 sw=2 :
