# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dvblast-git
pkgver=3.1.r6.g77cfaa8
pkgrel=1
pkgdesc="A simple and powerful MPEG-2/TS demux and streaming application"
arch=('i686' 'x86_64')
url="https://www.videolan.org/projects/dvblast.html"
license=('GPL2')
depends=('glibc' 'libev' 'bitstream')
makedepends=('git')
provides=('dvblast')
conflicts=('dvblast')
source=("git+https://code.videolan.org/videolan/dvblast.git")
sha256sums=('SKIP')


pkgver() {
  cd "dvblast"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dvblast"

  make
}

package() {
  cd "dvblast"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
