# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server
pkgver=2.3.3
_pkgver=$pkgver-lts-stable
_cef_version=3.3578.1870.gc974488
pkgrel=6
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL3')
depends=(ffmpeg libgl freeimage glew tbb openal sfml libxcomposite libxss pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix)
source=("https://github.com/CasparCG/server/archive/refs/tags/v$_pkgver.tar.gz"
        "https://github.com/CasparCG/server/commit/f0e678e7cabc69d573d59f24f9fd3ceca322ab85.patch"
        "https://github.com/CasparCG/server/commit/9cafa27838039aa65af3c97fe7d0c4531a952cdc.patch"
        "https://github.com/CasparCG/server/commit/9b0990bee89b7a9fa195db75c976c2b20e33ebb5.patch"
        "https://github.com/CasparCG/server/commit/e0bbb969b171c85332e77ee8b50f29b4634b7ad7.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1394.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1397.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1308.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1418.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1420.patch"
        "ffmpeg-5.0.patch"
        "https://cef-builds.spotifycdn.com/cef_binary_${_cef_version}_linux64_minimal.tar.bz2"
        casparcg)
sha256sums=('6d8e973949009e95bb5a6496e26cbe680efd77666936e131df0da569f8f7c7e1'
            '320576b7293b658166fe7e58393267a4fbfdc9802f42ae7bf95401a9cc78801f'
            'b67cd51d6b01fef1080b49cbb146e94981b1681b90aa3e5a4c28309ce1d5db1b'
            '3e9d6c96f3b196eb3104a59f99dab86a823c887a71ea09883f094003a184ad65'
            'c698a177a13a32ad2eb5e1a4ba304526cebc4b63c459893288f14147c4d83ae6'
            'ab663b18f7221d4bcb0835ec7290910341c94a6f3b03cb6defb3eabeaf0f3396'
            '153aea3dc15646db29c01ae4ee82517bbb024bf1d177ed1ea55bd080b525d06e'
            '5c6f2a3007e3a8739bc1f3eaec3c694af9836aed1943217843a92acff80950c1'
            '322158baef39dff7bfcf899a2ffea0fbe148443664beac380b9be6858a2b71d1'
            'a87a88f65e9cf192f4ae93afb20ecc4527b2357ebe1e26e23425d1e8f5e888ed'
            'd82dd031ca0d3d46b0c18c018b59a5426e0cba0627ac434b61d683b69b347f86'
            'b7c5401f342917ece7be583566bfc48b5cc1a8ff9f6470d396130b4aca7dfb22'
            'ce9dd83ae2ef9289e551f0a3ecbe246537195049c15f69bbfdc6c3ddd23291c2')

prepare() {
    cd "$srcdir/server-$_pkgver"

    for f in ../*.patch
    do
        patch --forward --strip=1 --input "$f"
    done

    # TODO don't statically link boost
    sed -i '/Boost_USE_RELEASE/d;/Boost_USE_DEBUG/d' src/CMakeModules/Bootstrap_Linux.cmake

    # pch files don't seem to work with FORTIFY_SOURCE, ignore warnings
    sed -i /-Winvalid-pch/d src/CMakeModules/PrecompiledHeader.cmake

    dos2unix src/shell/casparcg.config
}

build() {
    # build libcef_dll_wrapper
    cd "$srcdir/cef_binary_${_cef_version}_linux64_minimal"

    # https://bitbucket.org/chromiumembedded/cef/commits/84a5749
    CXXFLAGS="$CXXFLAGS -Wno-attributes" \
        cmake -B build -S . -DCMAKE_BUILD_TYPE=None -G Ninja

    ninja -C build
    cp build/libcef_dll_wrapper/libcef_dll_wrapper.a Release/

    cd "$srcdir"
    cmake -B build -S "server-$_pkgver/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCEF_ROOT_DIR="$srcdir/cef_binary_${_cef_version}_linux64_minimal" \
        -G Ninja

    ninja -C build
}

package() {
    install -d "$pkgdir/opt/casparcg/"
    cp -r "$srcdir/build/staging"/{bin,lib,casparcg.config} "$pkgdir/opt/casparcg/"

    install -Dm755 "$srcdir/casparcg" "$pkgdir/usr/bin/casparcg"

    ln -sf "/usr/share/fonts/liberation/LiberationMono-Regular.ttf" "$pkgdir/opt/casparcg/"
}
