# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-audiodecoder-timidity
_gitname=audiodecoder.timidity
pkgver=20150309.bf9ff93
_gitver=bf9ff93d544ddbdbf1228442e9b7c2ca7a14ef42
pkgrel=1
pkgdesc='Timidity decoder addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/notspiff/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel')
source=("https://github.com/notspiff/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

prepare() {
  msg "Starting make..."
  cd "$srcdir/$_gitname-$_gitver"
}

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR="$_prefix/lib" \
    -DCMAKE_INSTALL_LIBDIR_NOARCH="$_prefix/lib" \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
