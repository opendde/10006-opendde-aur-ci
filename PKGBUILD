# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx
pkgver=1.8.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=('i686' 'x86_64')
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor)
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat gcc-fortran libpulse libpng fftw)
source=(http://physics.princeton.edu/pulsar/K1JT/$pkgname-$pkgver.tgz)
md5sums=('13b863d113b864238cf1b07743af39e9')

build() {
    mkdir -p $srcdir/build
    cd $srcdir/build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release $srcdir/$pkgname-$pkgver
    make || return 1
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
