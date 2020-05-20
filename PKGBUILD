pkgname=mingw-w64-glslang
pkgver=8.13.3743
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('mingw-w64-spirv-tools')
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz)
sha256sums=('639ebec56f1a7402f2fa094469a5ddea1eceecfaf2e9efe361376a0f73a7ee2f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd glslang-$pkgver
  # error: conflicting declaration of ‘int sprintf_s
  sed -i "s|MINGW_HAS_SECURE_API|NO_MINGW|g" glslang/Include/Common.h
}

build() {
  cd glslang-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DENABLE_GLSLANG_BINARIES=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/glslang-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
#     ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
