# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>
# Contributor: Valentin Churavy <v.churavy@gmail.com>
# Contributor: Romain Reignier <rom.reignier@gmail.com>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>
# Contributor: CHEN Xing <cxcxcxcx@gmail.com>
# Contributor: Martin Imobersteg <martin.imobersteg@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Also largely inspired by `opencv` in extra, so including contributors too:
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_name=opencv
pkgname="$_name-git"
pkgver=3.3.1.r163.g0eb1bfa874
pkgrel=1
pkgdesc="Open Source Computer Vision Library"
url="http://opencv.org/"
license=('BSD')
arch=('x86_64')
depends=('intel-tbb' 'openexr' 'xine-lib' 'libdc1394' 'hdf5' 'gst-plugins-base-libs'
         'gtk3' 'protobuf')
makedepends=('git' 'cmake' 'python2-numpy' 'python-numpy' 'mesa' 'eigen')
optdepends=('opencv-samples'
            'hdf5: Support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python 3 interface'
            'python2-numpy: Python 2 interface')
conflicts=('opencv')
provides=("$_name=$pkgver")
source=('git+https://github.com/opencv/opencv.git'
        'git+https://github.com/opencv/opencv_contrib.git')
sha512sums=('SKIP'
            'SKIP')

_cmakeopts=('-D WITH_OPENCL=ON'
            '-D WITH_OPENGL=ON'
            '-D WITH_TBB=ON'
            '-D WITH_XINE=ON'
            '-D WITH_GSTREAMER=OFF'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=ON'
            '-D INSTALL_C_EXAMPLES=ON'
            '-D INSTALL_PYTHON_EXAMPLES=ON'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D CMAKE_SKIP_RPATH=ON'
            '-D CMAKE_INSTALL_LIBDIR=/usr/lib')

pkgver() {
    cd "$srcdir/$_name"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    mkdir -p build
    cd build

    cmake "${_cmakeopts[@]}" \
          -DOPENCV_EXTRA_MODULES_PATH="$srcdir"/opencv_contrib/modules \
          ../"$_name"

    make
}

package() {
    options=('staticlibs')

    cd build
    make DESTDIR="$pkgdir" install

    # install LICENSE file
    install -Dm644 "$srcdir"/"$_name"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
