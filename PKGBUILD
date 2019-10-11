# FOR THE NON-GIT VERSION (on which the git version is based):
#
# Contributor: Jaroslav Lichtblau <svetlemodry at archlinux dot org>
# Contributor: Brad Fanella <bradfanella at archlinux dot us>
# Contributor: Wittfella <wittfella at wittfella dot com>
# Maintainer: Stefan Husmann <stefan-husmann at t-online dot de>
#
# GIT VERSION
#
# Maintainer: BrainwreckedTech <bwtech at tuta dot io>

_pkgname=qtfm
pkgname=$_pkgname-git
pkgver=2019.08.23
pkgrel=1
pkgdesc="A lightweight file manager (git version)"
arch=('i686' 'x86_64')
url="https://github.com/rodlie/qtfm/releases"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'imagemagick')
provides=('qtfm')
conflicts=('qtfm')
source=('qtfm::git+https://github.com/rodlie/qtfm.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git log -1 --format=%ci | sed 's/[ :-]/./g' | cut -d. -f1-3
}

build() {
  cd $_pkgname
  [[ -d build ]] || mkdir build
  cd build
  qmake CONFIG+=release CONFIG+=with_ffmpeg CONFIG+=with_magick PREFIX=/usr ..
  make
}

package() {
  cd $_pkgname/build
  make INSTALL_ROOT="$pkgdir" install
}
