# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elektra
pkgver=0.9.2
pkgrel=3
pkgdesc="A universal hierarchical configuration store"
url="https://www.libelektra.org"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('yajl' 'qt5-base' 'python' 'curl' 'boost' 'swig' 'libuv' 'libgit2' 'libev' 'zeromq' 'discount' 'qt5-quickcontrols' 'hicolor-icon-theme')
optdepends=('ruby: for ruby bindings'
	    'python2: for python2-bindings'
	    'xerces-c: for python2-bindings'
	    'lua: for lua bindings')
makedepends=('docbook-xsl' 'cmake' 'doxygen' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ElektraInitiative/libelektra/archive/$pkgver.tar.gz")
sha256sums=('9b4872beb75cd4b1e2e4426920537150a323ae07463d014579a27175fa8dad71')

build() {
  cd lib$pkgname-$pkgver
  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCMAKE_INSTALL_RPATH:PATH=/usr/lib \
        -DPLUGINS:STRING="ALL" \
        -DTOOLS:STRING="ALL" \
        -DBUILD_STATIC:STRING=OFF \
        -DBINDINGS:STRING="ALL" \
        -DSWIG_EXECUTABLE:STRING="/usr/bin/swig" \
        -DLUA_INCLUDE_DIR:PATH=/usr/include \
        -DLUA_LIBRARY:STRING=/usr/lib/liblua.so \
	-DTARGET_PLUGIN_FOLDER="" \
	..
  make clean 
  make
}

package() {
  cd lib$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
