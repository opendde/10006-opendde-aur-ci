# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=yuzu
pkgver=mainline.0.700
pkgrel=1
pkgdesc="Nintendo Switch emulator"
arch=('x86_64')
url="https://yuzu-emu.org/"
license=('GPL2')
depends=('cubeb' 'qt5-webengine>=5.12')
makedepends=(
	'boost>=1.73'
	'catch2>=2.13'
	'cmake>=3.15'
	'cpp-httplib-compiled>=0.9.1'
	'discord-rpc>3.4.0'
	'ffmpeg'
	'fmt>=8.0'
	'git'
	'glslang'
	'libinih>=52'
	'libusb>=1.0.24'
	'libzip>=1.5'
	'lz4>=1.8'
	'ninja'
	'nlohmann-json>=3.8'
	'opus>=1.3'
	'qt5-tools>=5.12'
	'sdl2>=2.0.14'
	'spirv-headers>1.5.4.raytracing.fixed' # for sirit
	'vulkan-headers>=1.2.145'
	'xbyak>=5.96'
	'zlib>=1.2'
	'zstd>=1.5'
)
source=(
	"git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${pkgver//./-}"
	'git+https://github.com/MerryMage/dynarmic.git'
	'yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git'
	'git+https://github.com/ReinUsesLisp/sirit.git'
	'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
	'unbundle-cubeb.patch'
	'unbundle-discord-rpc.patch'
	'unbundle-httplib.patch'
	'unbundle-inih.patch'
	'unbundle-sdl.patch'
	'unbundle-spirv-headers.patch'
	'unbundle-xbyak.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'd152b6417f71d3a48c10eb94bd17b06fdf85e429feea07beaf535ceb22b207a579dfa78b85acefb97137be376ddc369adf91d221d4fe0f7f7888d6881073239f'
	'edd6991455eeeebaeaa5df22cd21d8f6c3834a42505dcae4703d65843f664d6e410ec90cc6850bfdb6071838d3da5f8a320a105ed305acc07d2ba9f05ebd02e8'
	'9c1bc256d79a8bea19e43f385f151278b60d71a8cd8746d796adcc1016e4b8b5b7c0e9205147e53144e2e1b2a8ecb2d2c04dd21b1d3794a607477c30117bc4c2'
	'169e3ccce1c51d1aedbb9a314d817120dc59a615016f295178967c2bbea17dcc840b4c7a82ce98777ade4c25e408c8a1fabf19fc9abe5fd56a208c32ceb1a354'
	'1112594336f6829483d9813e2144715cf965b21b700de07fb0206fd1089f29fdad8a4d17604ee87a93c4ce79fdae2f83eeef11fa489a86dafa25b959835a7e20'
	'f7abd00f331e9fe8b4196c966f736bac829b1aff8a5bf0517cd696ce38d112d7b42f30d513ab8a1ee5e52bb92d39f7fda9d2b74ef616cc5b62ce546a15938a25'
	'a54c9e039c6d477778ba59f0f87b510b049120b3af0ac9b408adfdeaa038482a8486305bcbb756a1a1c4eb9d926bac723567f7d4366bba70baafde3e5306e27d'
)

prepare() {
	cd yuzu-mainline
	git submodule init externals/{dynarmic,mbedtls,sirit,soundtouch}
	git config submodule.dynarmic.url ../dynarmic
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.sirit.url ../sirit
	git config submodule.soundtouch.url ../citra-soundtouch
	git submodule update
	patch -Np1 < ../unbundle-cubeb.patch
	patch -Np1 < ../unbundle-discord-rpc.patch
	patch -Np1 < ../unbundle-httplib.patch
	patch -Np1 < ../unbundle-inih.patch
	patch -Np1 < ../unbundle-sdl.patch
	patch -Np1 < ../unbundle-spirv-headers.patch
	patch -Np1 < ../unbundle-xbyak.patch
	rm .gitmodules
}

build() {
	cmake -S yuzu-mainline -B build -G Ninja \
		-DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
		-DBUILD_TAG=${pkgver/.0./-} \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDISPLAY_VERSION=${pkgver##*.} \
		-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
		-DENABLE_QT_TRANSLATION=ON \
		-DTITLE_BAR_FORMAT_IDLE="yuzu {}" \
		-DTITLE_BAR_FORMAT_RUNNING="yuzu {} | {}" \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_USE_BUNDLED_BOOST=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_LIBUSB=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-Wno-dev
	cmake --build build
}

check() {
	ninja -C build test
}

package() {
	depends+=(
		'libavcodec.so'
		'libavutil.so'
		'libboost_context.so'
		'libdiscord-rpc.so'
		'libfmt.so'
		'libhttplib.so'
		'libINIReader.so'
		'libswscale.so'
		'libusb-1.0.so'
		'libzip.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
