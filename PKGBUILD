pkgname=imgui
pkgver=1.87
pkgrel=2
pkgdesc="Bloat-free Graphical User interface for C++"
license=('MIT')
arch=('x86_64')
url="https://github.com/ocornut/imgui"
depends=('gcc-libs')
makedepends=('cmake')
source=("https://codeload.github.com/ocornut/imgui/tar.gz/v${pkgver}"
        "https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/CMakeLists.txt"
        "https://raw.githubusercontent.com/microsoft/vcpkg/master/ports/imgui/imgui-config.cmake.in") 
sha256sums=('b54ceb35bda38766e36b87c25edf7a1cd8fd2cb8c485b245aedca6fb85645a20'
            '1a8458a453e3e93cdca6c72ccb2f218607301bc7d6580718febb428e446720a4'
            '91528f60cca93d3bce042d2ac16a63169025ec25a34453b49803126ed19153ae')

prepare () {
  cp CMakeLists.txt imgui-config.cmake.in $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -S. \
    -B cmake-build-shared
  cmake --build cmake-build-shared
}

package() {
  cd $pkgname-$pkgver
  make -C cmake-build-shared DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
