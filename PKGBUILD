# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-core
pkgver=2.3.3
pkgrel=2
pkgdesc="C/C++ library to mainly provide Semantic Versioned inplmetation"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-core.git"
depends=('gcc' 'bison' 'libconfig' 'perl-xml-parser' 'intltool')
#backup=('etc/nanorc')
md5sums=('123c69ecf4ab034be8dced45fa9c3af1')
source=(https://github.com/azaeldevel/octetos-core/archive/2.3.3-beta.tar.gz)

build() {
    cd octetos-core-2.3.3-beta
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd octetos-core-2.3.3-beta
  make DESTDIR="${pkgdir}" install
}
