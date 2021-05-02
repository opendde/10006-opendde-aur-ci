# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=migraphx
pkgver=4.1.0
pkgrel=1
pkgdesc="AMD's graph optimization engine"
arch=('x86_64')
url="https://rocmsoftwareplatform.github.io/AMDMIGraphX/doc/html/"
license=('MIT')
depends=('rocm-cmake' 'miopen' 'hip' 'protobuf' 'pybind11' 'msgpack-c' 'blaze')
makedepends=('cmake' 'nlohmann-json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCmSoftwarePlatform/AMDMIGraphX/archive/rocm-$pkgver.tar.gz"
        "$pkgname-$pkgver-half.tar.gz::https://github.com/ROCmSoftwarePlatform/half/archive/refs/tags/1.12.0.tar.gz")
sha256sums=('f9b1d2e25cdbaf5d0bfb07d4c8ccef0abaa291757c4bce296c3b5b9488174045'
            '0a08660b68abb176ebc2a0cdf8de46e3182a7f46c66443bb80dbfaaec98cf969')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_PREFIX_PATH="$srcdir/half-1.12.0" \
        "$srcdir/AMDMIGraphX-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
