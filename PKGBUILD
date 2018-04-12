# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbdplus-git
pkgver=0.1.2.31.gc7f1e8b
pkgrel=1
pkgdesc="Open implementation of BD+ protocol. (GIT version)"
arch=('x86_64')
license=('LGPL')
url='http://www.videolan.org/developers/libbdplus.html'
depends=('libaacs')
makedepends=('git')
provides=('libbdplus'
          'libbdplus.so'
          )
conflicts=('libbdplus')
source=('git://git.videolan.org/libbdplus.git')
sha256sums=('SKIP')

pkgver() {
  cd libbdplus
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd libbdplus
  ./bootstrap
}

build() {
  cd libbdplus
  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  make -C libbdplus DESTDIR="${pkgdir}" install
}
