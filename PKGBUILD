# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Maintainer: Reihar <reihar@necronomicon.fr>

pkgname=stone-soup-ncurses
_majorver=0.28
pkgver=${_majorver}.0
pkgrel=1
pkgdesc='Open-source, single-player, role-playing roguelike game of exploration and treasure-hunting (ncurses-only)'
arch=('i686' 'x86_64')
url='http://crawl.develz.org/'
depends=('lua51' 'ncurses' 'sqlite' 'glu' 'freetype2' 'ttf-dejavu')
makedepends=('bison' 'flex' 'python-yaml')
conflicts=('crawl' 'stone-soup' 'stone-soup-tiles' 'stone-soup-git')
license=('custom')
install=stone-soup-ncurses.install
source=("http://github.com/crawl/crawl/releases/download/${pkgver}/stone_soup-${pkgver}-nodeps.tar.xz")
sha256sums=('5a6be168f8888b84bdb199184ca20bd8636f77ba7e9e0124ebee8850092f2f47')

prepare() {
  cd "$srcdir"
  cd "stone_soup-$pkgver/source"
  
  # git tarball weirdness
  echo "$pkgver" > util/release_ver
  
  # adjust makefile to use /usr/bin, owner root:root,
  # disable setgid on executable

  sed -i 's|bin_prefix    := bin|bin_prefix    := usr/bin|' Makefile
  sed -i 's/INSTALL_UGRP := games:games/INSTALL_UGRP := root:root/' Makefile
  sed -i 's|MCHMOD := 2755|MCHMOD := 755|' Makefile
}

package() {
  cd "$srcdir"
  cd "stone_soup-$pkgver/source"

  #Building the console version
  make DESTDIR="${pkgdir}" \
       SAVEDIR="~/.crawl/" \
       DATADIR="/usr/share/${pkgname}/data" \
       USE_UNICODE=y \
       install

  
  # install crawl license
  install -D -m644 ../LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
