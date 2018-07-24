# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-systemqt-notoemoji
pkgver=1.3.10
pkgrel=1
pkgdesc='Official Telegram Desktop client (with noto emoji)'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl')
makedepends=('cmake' 'git' 'gyp' 'range-v3' 'python' 'libappindicator-gtk3')
optdepends=('libnotify: desktop notifications')
conflicts=('telegram-desktop')
provides=('telegram-desktop')

_emojiver="v1"
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "variant::git+https://github.com/mapbox/variant"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "Catch::git+https://github.com/philsquared/Catch"
    "crl::git+https://github.com/telegramdesktop/crl.git"
    "https://s3.amazonaws.com/aur-telegram-desktop-notoemoji/noto-emoji-${_emojiver}.tar.xz"
    "build-time-optimize.patch.in"
    "tg.protocol"
    "CMakeLists.inj"
    "tdesktop.patch"
    "no-gtk2.patch"
    "libtgvoip.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '376a4860e37b0f60892f362e954f976a563c632579167003b4aacbb24b6fea6aabb4e6952baf6d1a546b961936935cc49cf0e0ce9570320245b6bb326cb149e5'
            'fa7042f370ae4e2e14d083395743cdee25bfedc39ab5273b5d1ab12fb074757cf76dab065f2abcb44cad018920e711142fbf24a2b9cd30f517c5a5b46d6a6182'
            'b87414ceaae19185a8a5749cea1f6d9f3fc3c69b8dd729e3db8790cde00b987c3c827cd30baf0eac579d1884e34aa2f37bb90778c3c0bc9ca211d75a82891b9d'
            '2647251940f0d3a2d41ca8a32a592f1ab1e23fe02d3b11d8dc3a54ef34df7c290c9cbf3df76b09970e1cba15c149bc38d49fc824a173d4b21c54edb3c5d5a3da'
            '00b4307143cf599859d9b9b6d7ac4acbe8b407da55a1e3833921e113dc3aed8c61f2e5f2c1c37e81a261ba4b9e6f40d9bf5f8c90c20dcf0820cfb73852cb091d'
            '7a37e0ca582145a56a411585aec0bc94889dc18a80cc038d2efa237e19eebf8b67d56825e068be88f7566b08316ce068d7f20c25729caa33d0e9d6c370325025'
            'd60694dc701aa985b0e82a12c9732b945082470441c687b33167a94f94efcf253baf43bb7280ec160ba338485ee5c62de138e4804cae05f27cc5cf4298166d39')

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
    git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
    git submodule update

    patch -Np1 -i "$srcdir/tdesktop.patch"
    patch -Np1 -i "$srcdir/no-gtk2.patch"

    # speed up builds: disable debugging information and use parallel LTO
    sed "s/@NPROC@/$(nproc)/g" "$srcdir/build-time-optimize.patch.in" >"$srcdir/build-time-optimize.patch"
    patch -Np1 -i "$srcdir/build-time-optimize.patch"

    cd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"

    for x in "" "_125x" "_150x" "_200x" "_250x"; do
        cp -vf "$srcdir/noto-emoji-${_emojiver}/emoji$x.webp" "$srcdir/tdesktop/Telegram/Resources/art/emoji$x.webp"
    done
}

build() {
    cd "$srcdir/tdesktop"
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_UNITY_INTEGRATION"
    export EXTRA_FLAGS="-Winvalid-pch"
    export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"
    gyp \
        -Dbuild_defines=${GYP_DEFINES} \
        -Gconfig=Release \
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
    NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
    sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
    cd "$srcdir/tdesktop/out/Release"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/out/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram.png"
    done
}
