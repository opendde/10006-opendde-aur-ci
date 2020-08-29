# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-faustgen2
prjname=pd-faustgen
pkgver=2.0.0
pkgrel=1
pkgdesc="The FAUST compiler embedded in a Pd external"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/agraef/$prjname"
depends=('pd' 'llvm-libs')
makedepends=('faust' 'cmake' 'llvm')
source=("https://github.com/agraef/$prjname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('751fe89d59dda5b7bbecd699c88accf3')

build() {
     cd "$pkgname-$pkgver"
     mkdir build && cd build
     cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DINSTALLED_FAUST=ON
     make
}

package() {
     cd "$pkgname-$pkgver/build"
     make install DESTDIR="$pkgdir"
}
