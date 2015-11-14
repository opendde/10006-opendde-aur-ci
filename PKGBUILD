# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=lkl-linux-git
_srcname=linux
pkgver=4.3.r329.g5eb6acb
pkgrel=1
pkgdesc="Linux kernel library for building portable linux drivers (git version)"
arch=('i686' 'x86_64')
url="https://github.com/lkl/linux/blob/master/Documentation/lkl.txt"
license=('GPL2')
depends=('glibc')
makedepends=('bc' 'python2' 'git')
options=('!buildflags' 'staticlibs')
source=('git+git://github.com/lkl/linux.git')
sha256sums=('SKIP')

export LC_ALL=C

pkgver() {
  cd "${srcdir}/${_srcname}"

  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

prepare() {
  cd "${srcdir}/${_srcname}"
  cd tools/lkl
  # apply patches or something
  msg "set python2 as default"
  rm -rf bin
  mkdir -p bin
  ln -s /usr/bin/python2 bin/python
  export PATH="${srcdir}/${_srcname}"/tools/lkl/bin:"${PATH}"
}

build() {
  cd "${srcdir}/${_srcname}"
  cd tools/lkl
  make NM=gcc-nm AR=gcc-ar
}

package() {
  cd "${srcdir}/${_srcname}"
  cd tools/lkl
  mkdir -p "${pkgdir}"/usr/{bin,lib,share/licenses/lkl,include/lkl}
  cp lib/*.a "${pkgdir}"/usr/lib/
  cp -ar include/* "${pkgdir}"/usr/include/
  #optional proof-of-concept binaries
  cp cptofs "${pkgdir}"/usr/bin/
  cp lklfuse "${pkgdir}"/usr/bin/
  cp fs2tar "${pkgdir}"/usr/bin/
  #license
}




