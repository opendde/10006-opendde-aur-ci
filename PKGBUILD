# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.3.1
pkgrel=2
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
    	 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm'
		 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch' 'glibmm-2.68')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
			 'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt' 'qt6-tools')
optdepends=('webkit2gtk: embedded browser features'
			'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
        "block-sponsored_messages.patch")
sha512sums=('5086081579a1998ac87d3903b22f964961b1e8421d9d314ab3f36f6750a5065f11ef8c8970bcf658abaf14b810f09e986d25592320d2b3502104240962534d71'
            'a52be36a626a79442c1f34496a1444e8012515f67a8899a34c5a97109a847a6a5d8c87f866c5c6315b87bfe411e902315a64cf93d413d7bf070b819a5f93d828')

prepare() {
    cd $_pkgname-$pkgver-full
    rm -rf Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl
    patch -Np1 --binary -i ../block-sponsored_messages.patch
}

build() {
    cd "${srcdir}/$_pkgname-$pkgver-full"
    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_API_TEST=ON
    sed -i '/LINK_LIBRARIES/s/$/ \/usr\/lib\/liblzma.so/' build/build.ninja
    ninja -C build
}

package() {
    cd $_pkgname-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
    install -Dm644 /dev/null "$pkgdir/etc/tdesktop/externalupdater"
}
