# Maintainer: Alexandre Ferrando <alferpal@gmail.com>

pkgname=iojs
pkgver=1.4.1
_foldername=iojs-v${pkgver}
pkgrel=1
pkgdesc='Evented I/O for V8 JavaScript - Node.js fork'
url='http://iojs.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('openssl' 'zlib') # 'libuv')
makedepends=('python2' 'git')
optdepends=('python2: for node-gyp')
provides=('nodejs')
conflicts=('nodejs' 'iojs-bin')
options=('!emptydirs')
source=("https://iojs.org/dist/v${pkgver}/iojs-v${pkgver}.tar.gz")
sha256sums=('da7bbb2ec8d0980ddbfca9d6de2ba5e9d5b57b41f6ef50140da746577fc98c34')

prepare() {

  cd "${srcdir}/${_foldername}"

  msg "preparing python version"

  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd "${srcdir}/${_foldername}"

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl \
    --shared-zlib 

  make
}

check() {
  cd "${_foldername}"
  make test || warning "Tests failed"
}

package() {
  cd "${srcdir}/${_foldername}"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
