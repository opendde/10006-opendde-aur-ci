# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Feng Wang <wanng.fenng AT gmail DOT com>
pkgname=gmm
pkgver=5.1
pkgrel=1
pkgdesc="Generic C++ finite element library"
arch=('i686' 'x86_64')
url="http://home.gna.org/getfem/"
license=('LGPL')
source=("http://download.gna.org/getfem/stable/${pkgname}-${pkgver}.tar.gz")
sha256sums=('90e6bf309b81f496b401a375fe99826ad4b5c6ba99db6c92b37f9261db462636')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

check(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

