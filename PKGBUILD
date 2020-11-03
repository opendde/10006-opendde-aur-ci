# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>

pkgbase=srslte-falcon-patch-git
pkgname=$pkgbase
_pkgname=srsLTE
pkgver=falcon_v0.1.r3.g1bea0987
pkgrel=1
pkgdesc='Open source SDR LTE software suite from Software Radio Systems (SRS) - patched for FALCON'
arch=('x86_64')
url='https://github.com/falkenber9/srsLTE'
license=('AGPL3')
depends=('fftw' 'mbedtls' 'boost-libs' 'lksctp-tools' 'libconfig'
         'libuhd' 'soapysdr' 'bladerf' 'zeromq' 'pcsclite' 'srsgui')
makedepends=('git' 'cmake' 'boost')
provides=('srslte-falcon-patch' 'srslte=18.09.0' 'srsue' 'srsenb' 'srsenb')
conflicts=('srslte-falcon-patch' 'srslte' 'srsue' 'srsenb' 'srsenb')
source=("git+https://github.com/falkenber9/srsLTE.git#branch=falcon-dev")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  echo 'Building srslte...'

  cmake .. \
    -B "build" \
    -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_GENERIC=True

  make -C "build" -j 4
}

package() {
  make -C "build" DESTDIR="$pkgdir" install
}
