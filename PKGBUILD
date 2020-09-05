# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=farragone
pkgver=0.2.4
pkgrel=2
pkgdesc="Batch file renamer for programmers"
arch=(any)
url=http://ikn.org.uk/app/farragone
license=(GPL3)
makedepends=("python>=3")
depends=("python>=3.1" "python-pyqt5>=5.2" "qt5-base>=5.2" libxkbcommon-x11)
source=(http://ikn.org.uk/download/app/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('76d7aaaac51f4a9565550f3d21e79e38')

build () {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname}-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
}
