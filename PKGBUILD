pkgname=mingw-w64-kitemviews
pkgver=5.33.0
pkgrel=1
arch=(any)
pkgdesc="Widget addons for Qt Model/View (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-qt5-base)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kitemviews-${pkgver}.tar.xz")
md5sums=('64184a418ffc73d1920ba1dd10d30656')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd kitemviews-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
