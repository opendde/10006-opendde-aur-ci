# Maintainer: Ethan Rakoff <ethan@ethanrakoff.com>
pkgname=threemawebqt
pkgver=0.1
pkgrel=1
pkgdesc="Thin client for Threema Web, the web client for Threema, an E2E encrypted messaging app."
arch=('i686' 'x86_64')
url="https://github.com/ethanrakoff/${pkgname}"
license=('MIT')
groups=()
depends=('qt5-base' 'qt5-webengine')
makedepends=('make')
source=("git+${url}")
md5sums=('SKIP')

build() {
  cd "${pkgname}/src"

  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  make INSTALL_ROOT="${pkgdir}" install 

  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
