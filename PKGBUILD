# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

# Based on numix-themes-git
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-themes-darkblue
pkgver=2.6.7
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce) (Dark Blue Variant)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'glib2' 'ruby-sass')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/numixproject/numix-gtk-theme/archive/${pkgver}.tar.gz"
		'dark_colors.patch')
md5sums=('622d373ca3d755bb612519388020b45a'
         'ff8c5ceda5fc260a9693d46c5bfff58b')

prepare() {
  cd "$srcdir/numix-gtk-theme-$pkgver/src/"

  patch -Np1 -i "$srcdir/dark_colors.patch"
  ln -srf gtk-3.0/gtk{-dark,}.css
  ln -srf gtk-3.20/gtk{-dark,}.css
}

build() {
  cd "$srcdir/numix-gtk-theme-$pkgver/"
  make
}

package() {
  cd "$srcdir/numix-gtk-theme-$pkgver/"
  make INSTALL_DIR="${pkgdir}/usr/share/themes/Numix-DarkBlue" install
}

# vim: ts=2 sw=2 et:
