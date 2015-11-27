# Maintainer: farwayer <farwayer [at] gmail [dot] com>

_pkgbase=opus
pkgname=lib32-$_pkgbase
pkgver=1.1.1
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet"
arch=('x86_64')
url="http://www.opus-codec.org/"
license=('custom')
depends=('lib32-glibc' 'opus')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://downloads.xiph.org/releases/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('9b84ff56bd7720d5554103c557664efac2b8b18acc4bbcc234cb881ab9a3371e')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --enable-custom-modes --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
  install -D COPYING "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
