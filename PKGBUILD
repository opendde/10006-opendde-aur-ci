# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

_imgui_commit='e628122da006c0e9f7e695592765696d8253cf6f'

pkgbase=mangohud
pkgname=('mangohud' 'lib32-mangohud')
pkgver=0.3.1
pkgrel=1
url='https://github.com/flightlessmango/MangoHud'
license=('MIT')
arch=('x86_64')
makedepends=('meson' 'python-mako' 'glslang' 'libglvnd' 'lib32-libglvnd'
             'vulkan-headers' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader')
source=("https://github.com/flightlessmango/MangoHud/archive/v$pkgver.tar.gz"
        "https://github.com/flightlessmango/imgui/archive/$_imgui_commit.tar.gz")
sha256sums=('61ef3bd16a7579b096b019fc2b1ded6b315ed50b833b8a51a7fb5dcb135f5577'
            '744978dc2cd423330f28442792a9c0c97dce9c8f271cbe8c22d6197f882ba181')

_srcdir="MangoHud-$pkgver"

prepare() {
    rmdir "$_srcdir/modules/ImGui/src"
    ln -sr "imgui-$_imgui_commit" "$_srcdir/modules/ImGui/src"
}

build() {
    arch-meson -Dappend_libdir_mangohud=false -Duse_system_vulkan=enabled "$_srcdir" build64
    ninja -C build64

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    export LLVM_CONFIG="/usr/bin/llvm-config32"
    arch-meson -Dappend_libdir_mangohud=false -Duse_system_vulkan=enabled "$_srcdir" build32 --libdir lib32
    ninja -C build32
}

package_mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more'
    depends=('sh' 'gcc-libs' 'libx11')

    DESTDIR="$pkgdir" ninja -C build64 install

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lib32-mangohud() {
    pkgdesc='A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more (32-bit)'
    depends=('sh' 'lib32-gcc-libs' 'lib32-libx11')

    DESTDIR="$pkgdir" ninja -C build32 install

    rename "$pkgbase" "$pkgname" "$pkgdir/usr/share/doc/$pkgbase"
    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
