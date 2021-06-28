# Maintainer: basinilya <basinilya@gmail.com>
# Maintainer: TDY <tdy@gmx.com>

pkgname=xgrabcolor
pkgver=5.4.6
pkgrel=5
pkgdesc="A basic color picker"
arch=('i686' 'x86_64')
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=xgrabcolor&full="
license=('GPL')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake')
source=(http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #export LDFLAGS="${LDFLAGS//--as-needed,}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=Yes
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha256sums=('457b73f84f68cf90cf995e719a0bcc2a923bb67e7e459294935b82a346c0e638')
