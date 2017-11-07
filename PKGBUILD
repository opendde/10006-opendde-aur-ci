# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lame-svn
pkgver=r6425
pkgrel=1
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder"
arch=('i686' 'x86_64')
url="http://lame.sourceforge.net/"
license=('LGPL')
depends=('glibc' 'ncurses')
makedepends=('subversion' 'nasm')
provides=('lame')
conflicts=('lame')
options=('staticlibs')
source=("svn+https://svn.code.sf.net/p/lame/svn/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk/lame"

  ./configure --prefix="/usr" --enable-nasm
  make
}

package() {
  cd "trunk/lame"

  make DESTDIR="$pkgdir" install
}
