# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: djgera
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=geany-plugins-gtk3
_pkgname=geany-plugins
pkgver=1.28
pkgrel=2
pkgdesc='Plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=("geany-gtk3>=$pkgver" 'gtkspell3' 'webkitgtk' 'ctpl' 'gpgme' 'vte3' 'desktop-file-utils' 'gtk-update-icon-cache' 'lua51' 'libgit2')
makedepends=('intltool' 'vala' 'gdb' 'cppcheck' 'libgit2')
optdepends=('hspell: hebrew spell checker')
provides=("geany-plugins")
conflicts=("geany-plugins")
source=("http://plugins.geany.org/${_pkgname}/${_pkgname}-$pkgver.tar.bz2")
md5sums=('54ad042b6f91ff8e7a497c22faa2db4b')



build() {
cd "${_pkgname}-$pkgver"

./configure \
  --prefix=/usr \
  --libexecdir=/usr/lib \
  --enable-gkt3
make 
}

package() {
make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install
}

