# Maintainer: Brendan Szymanski <bscubed@pm.me>

_pkgname=yuzu
pkgname=$_pkgname-early-access
pkgver=3098
pkgrel=2
pkgdesc="An experimental open-source Nintendo Switch emulator/debugger (early access version)"
arch=('i686' 'x86_64')
url="https://yuzu-emu.org/"
license=('GPL2')
depends=('boost-libs' 'shared-mime-info' 'hicolor-icon-theme' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-webengine' 'libxkbcommon-x11' 'ffmpeg' 'fmt' 'libzip' 'opus' 'libfdk-aac' 'lz4' 'mbedtls' 'openssl' 'zstd')
makedepends=('llvm' 'git' 'glslang' 'cmake' 'ninja' 'graphviz' 'doxygen' 'clang' 'boost' 'catch2' 'nlohmann-json' 'rapidjson' 'qt5-tools' 'desktop-file-utils' 'robin-map')
optdepends=('qt5-wayland: for Wayland support')
provides=('yuzu')
conflicts=('yuzu')
source=("https://github.com/pineappleEA/pineapple-src/archive/EA-${pkgver}.tar.gz"
"https://raw.githubusercontent.com/pineappleEA/Pineapple-Linux/master/yuzu.xml"
"git+https://github.com/yuzu-emu/yuzu-mainline.git")
sha256sums=('afed8f0b0591f3dda2297bd97af502d0741173283f86be10978a1457d55fb90e'
            'e76ab2b3566d8135930e570ede5bed3da8f131270b60db818e453d248880bdf2'
            'SKIP')

prepare() {
  cd "$srcdir/yuzu-mainline"
  git submodule update --init --recursive

  cd "$srcdir/pineapple-src-EA-${pkgver}"
  find . -name "CMakeLists.txt" -exec sed -i 's/^.*-Werror$/-W/g' {} +
  #find . -name "CMakeLists.txt" -exec sed -i 's/^.*-Werror=.*)$/ )/g' {} +
  find . -name "CMakeLists.txt" -exec sed -i 's/^.*-Werror=.*$/ /g' {} +
  find . -name "CMakeLists.txt" -exec sed -i 's/-Werror/-W/g' {} +
  sed -i -e 's/--quiet //g' src/video_core/host_shaders/CMakeLists.txt
  sed -i -e 's#${SPIRV_HEADER_FILE} ${SOURCE_FILE}#${SPIRV_HEADER_FILE} ${SOURCE_FILE} 2>/dev/null#g' src/video_core/host_shaders/CMakeLists.txt
  sed -i -e '/Name=yuzu/ s/$/ Early Access/' dist/yuzu.desktop
  sed -i -e '/yuzu %f/a StartupWMClass=yuzu' dist/yuzu.desktop
  sed -i -e 's_^MimeType=.*_&application/x-nx-nsp;application/x-nx-xci;_' dist/yuzu.desktop
  sed -i -e 's| (%2)||' src/yuzu/aboutdialog.ui

  cp -f  $srcdir/yuzu.xml dist/yuzu.xml

  cp -R $srcdir/yuzu-mainline/externals/xbyak externals/
  cp -R $srcdir/yuzu-mainline/externals/dynarmic externals/
  cp -R $srcdir/yuzu-mainline/externals/enet externals/
  cp -R $srcdir/yuzu-mainline/externals/mbedtls externals/
  cp -R $srcdir/yuzu-mainline/externals/cubeb externals/
  cp -R $srcdir/yuzu-mainline/externals/discord-rpc externals/
  cp -R $srcdir/yuzu-mainline/externals/sirit externals/
  cp -R $srcdir/yuzu-mainline/externals/inih externals/
  cp -R $srcdir/yuzu-mainline/externals/Vulkan-Headers externals/
  cp -R $srcdir/yuzu-mainline/externals/cpp-httplib externals/
  cp -R $srcdir/yuzu-mainline/externals/cpp-jwt externals/
  cp -R $srcdir/yuzu-mainline/externals/libressl externals/
}
build() {
  cd "$srcdir/pineapple-src-EA-${pkgver}"
	mkdir -p build && cd build
  cmake .. -GNinja \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_C_FLAGS="$CFLAGS -flto=thin" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DTITLE_BAR_FORMAT_IDLE="yuzu Early Access $pkgver" \
    -DTITLE_BAR_FORMAT_RUNNING="yuzu Early Access $pkgver | {3}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
    -DYUZU_USE_QT_WEB_ENGINE=ON \
    -DUSE_DISCORD_PRESENCE=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DYUZU_USE_BUNDLED_OPUS=OFF \
    -DDYNARMIC_NO_BUNDLED_FMT=ON \
    -DDYNARMIC_NO_BUNDLED_ROBIN_MAP=ON \
    -DYUZU_USE_BUNDLED_FFMPEG=OFF \
    -DYUZU_USE_BUNDLED_LIBUSB=OFF \
    -DYUZU_USE_BUNDLED_QT=OFF \
    -DYUZU_USE_EXTERNAL_SDL2=OFF

  ninja
}

package() {
	cd "$srcdir/pineapple-src-EA-${pkgver}/build"
	DESTDIR="$pkgdir" ninja install
}
