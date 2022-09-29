# Maintainer: solopasha <daron439 at gmail dot com>
# Contributor: KspLite <ksplite@outlook.com>
pkgname=64gram-desktop
_pkgname=64Gram
_kcorever=5.98.0
pkgver=1.0.46
pkgrel=1
epoch=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt' 'qt6-tools')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full.tar.gz"
        "block-sponsored_messages.patch"
        "64gramdesktop.desktop"
        "https://download.kde.org/stable/frameworks/${_kcorever%.*}/kcoreaddons-${_kcorever}.tar.xz"
        "https://invent.kde.org/frameworks/kcoreaddons/-/merge_requests/258.patch")
sha512sums=('e7e68b1f911ad8d2096f67b0d59efd7141d82d49401a3f4b4ba0f3f48258dd735258b0ec16234bf0784f47e67803eea30084f995bfc1b5bb1706938d4075be4e'
            'c662524ca4f4a8df021ee94696d84896ed9a271df321933942806dda4544ea25f51a650ec8b4fc72f9a2219ea54cbfaf37b9604124f7263c86f74f1d647587ae'
            '71e91adfa3d8fb198380069e42a6119fb37a588df2ad47b8eeaf5a87c874cb257da1e45eaa8229333bb7fc8a9218fb3411977642239bc93f01e37a2fdf58db3e'
            '7370860c300a2ceb009622a3ed543ffda7cd36ae4a339abc6fb4bc39a08abbbd8d09eb5da08b2702e9dfa2db3c35572df654ff265275d3cd96b076123a022198'
            'e36b3962166cd1fb5f4f9f3eb567b6bbc1ac18c87a5d1d94096adfc9e2f0fe8e59d1aec12341a682445f1943b0d885c8b65ca6f0441221bb112110c491d382ac')
prepare() {
    cd $_pkgname-$pkgver-full
    patch -Np1 --binary -i ../block-sponsored_messages.patch

    cd ../kcoreaddons-$_kcorever
    patch -Np1 -i ../258.patch
}

build() {
    cd kcoreaddons-$_kcorever
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${srcdir}/kcoreaddons" \
        -DBUILD_TESTING=OFF \
        -DBUILD_WITH_QT6=ON \
        -DEXCLUDE_DEPRECATED_BEFORE_AND_AT=5.78.0 \
        -DBUILD_SHARED_LIBS=OFF
    ninja -C build
    ninja -C build install

    cd "${srcdir}/$_pkgname-$pkgver-full"
    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DKF5CoreAddons_DIR="${srcdir}/kcoreaddons/lib/cmake/KF5CoreAddons" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_API_TEST=ON \
        -DTDESKTOP_LAUNCHER_BASENAME=64gramdesktop
    sed -i '/LINK_LIBRARIES/s/$/ \/usr\/lib\/liblzma.so/' build/build.ninja
    ninja -C build
}

package() {
    cd $_pkgname-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
    mv "$pkgdir/usr/bin/telegram-desktop" "$pkgdir/usr/bin/64gram-desktop"
    install -Dm644 "$srcdir/64gramdesktop.desktop" -t "$pkgdir/usr/share/applications"
    find "$pkgdir" -type f -name "telegram.png" -exec rename telegram.png 64gram.png {} \;
    install -Dm644 /dev/null "$pkgdir/etc/tdesktop/externalupdater"
}
