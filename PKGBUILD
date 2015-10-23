# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ooc
pkgver=1.3b
pkgrel=1
pkgdesc="A kit to program in C in an object-oriented manner."
arch=('i686' 'x86_64')
url="http://ooc-coding.sourceforge.net/"
license=('LGPL')
source=(http://downloads.sourceforge.net/project/ooc-coding/source//${pkgname}-${pkgver}.tar.gz)
options=(staticlibs)
md5sums=('078cd557a1a92605d3e8faa3aec4d9c1')
sha256sums=('b9dded349b33975f705d34cbe14aed6d869f29e62532c4c9465006e238f15e1e')
sha384sums=('f37eb57fdcc4a5d2d596654242621e735eed4f65526b7c9110f8cd5c248b5b2c9ec16a512881f0a451563be54f4fcfcc')
sha512sums=('7644868468b787a4de4e728aa990ad244bbcc6b59ad8e624674a971b0ebea56bb5024b239f5d99f7cacdfc352640aa3d6623b81a1ab7ef6dc5285b8f3c3df257')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
