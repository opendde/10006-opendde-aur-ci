# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv-cuda
pkgver=4.0.1
pkgrel=1
provides=(opencv opencv-samples)
conflicts=(opencv opencv-samples)
pkgdesc="Open Source Computer Vision Library with CUDA support"
arch=(x86_64)
license=(BSD)
url="http://opencv.org/"
options=(staticlibs)
depends=(intel-tbb openexr gst-plugins-base libdc1394 cblas lapack libgphoto2 jasper cuda)
makedepends=(cmake python-numpy python2-numpy mesa eigen hdf5 lapacke gtk3 nvidia-sdk)
optdepends=('opencv-samples: samples'
            'gtk3: for the HighGUI module'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python 3 interface'
            'python2-numpy: Python 2 interface')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('b79ccdc4797a959c5ab17249a8a302c066248ae070e4d7010e2d77a625fdb30a'
            '0d8acbad4b7074cfaafd906a7419c23629179d5e98894714402090b192ef8237')

prepare() {
  msg2 "Patching sources for CUDA v10"
  sed -i 's|nvcuvid.h|nvidia-sdk/nvcuvid.h|' opencv_contrib-$pkgver/modules/cud*/src/*.hpp

  mkdir -p build
}

build() {
  cd build
  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cmake ../opencv-$pkgver \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCPU_BASELINE_DISABLE=SSE3 \
    -DCPU_BASELINE_REQUIRE=SSE2 \
    -DWITH_NVCUVID=ON \
    -DWITH_CUDA=ON \
    -DCUDA_FAST_MATH=ON \
    -DWITH_CUBLAS=ON \
    -DCUDA_HOST_COMPILER=/usr/bin/gcc-7 \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DOPENCV_SKIP_PYTHON_LOADER=ON \
    -DOPENCV_PYTHON3_INSTALL_PATH=$_pythonpath \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    -DOPENCV_GENERATE_PKGCONFIG=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir"/opencv-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  cd "$pkgdir"/usr/share

  # separate samples package; also be -R friendly
  if [[ -d opencv4/samples ]]; then
    mv opencv4 $pkgname # otherwise folder naming is inconsistent
  elif [[ ! -d opencv4 ]]; then
    warning "Directory naming issue; samples package may not be built!"
  fi
}
