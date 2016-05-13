# Maintainer: farseerfc <farseerfc@gmail.com> 
# Contributor: nylocx <just18@gmx.de>
# Contributor: Llumex03 <l.lumex03@gmail.com>
# Original uploader in CCR: FranzMari 
# Original uploader in AUR: á¸¶á¸·umex03
# Fixes in AUR by: ogarcia

pkgname=libqtelegram-ae-git
epoch=3
pkgver=6.1.stable.r8.g7bc3c3d
pkgrel=1
pkgdesc="Telegram library written in Qt based on telegram-cli code"
arch=('x86_64' 'i686')
license=('GPL3')
url="https://launchpad.net/libqtelegram"
provides=("libqtelegram-ae=$epoch:$pkgver")
conflicts=('libqtelegram-ae')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('cmake' 'git')
source=("$pkgname"::"git+https://github.com/Aseman-Land/libqtelegram-aseman-edition.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
 
prepare() {
  cd $pkgname
  mkdir -p build
}
 
build() {
  cd $pkgname/build
  qmake-qt5 -r .. QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr INSTALL_LIBS_PREFIX=/usr/lib INSTALL_HEADERS_PREFIX=/usr/include
  make
} 
 
package() {
  cd $pkgname/build
  make INSTALL_ROOT="$pkgdir" install
}
