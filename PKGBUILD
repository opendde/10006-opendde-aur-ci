# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: aimileus < me at aimileus dot nl >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=nestopia-git
_pkgname=nestopia
pkgver=1.47.r266.gbb5e78c
pkgrel=1
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'gtk3' 'glu' 'libarchive')
makedepends=('unzip' 'mesa' 'xdg-utils' 'cmake' 'git' 'autoconf-archive')
source=("git+https://github.com/rdanbrook/nestopia.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make install DESTDIR="$pkgdir"
}
