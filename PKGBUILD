# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=multimc5
pkgver=0.6.12
pkgrel=2
__pkgver_libnbtplusplus=multimc-0.6.1
__pkgver_quazip=multimc-3
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'java-runtime')
provides=('multimc')
conflicts=('multimc')
makedepends=('cmake' 'java-environment')
optdepends=('mcedit: Allows editing of minecraft worlds'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/MultiMC/MultiMC5/archive/${pkgver}.tar.gz"
        "https://github.com/MultiMC/libnbtplusplus/archive/${__pkgver_libnbtplusplus}.tar.gz"
        "https://github.com/MultiMC/quazip/archive/${__pkgver_quazip}.tar.gz"
        "quazip-fix-build-with-qt-511.patch"
        "modern-java.patch"
        "add-limits-header.patch::https://github.com/MultiMC/MultiMC5/commit/c2fd714f8d77db3223c5cb1a2d7f902d3e3e73fd.patch"
        "konamicode-fix-type-mismatch.patch::https://github.com/MultiMC/MultiMC5/commit/3a1abb555b844c79a80615727b11019403767ce7.patch"
)
sha512sums=('334b0996b7b49a0f4a46a3e5b08d50d5f7aa398b8d5871772c751c1f98438d9584ffcdaf27ad6d2e84b2776415bd38910dffb8e746c4b343916c6849df2146da'
            '81a1640a069d88df7ba0abf72089aecbe1e9d791c88acaaa7e70c8f0bcd0512cf8698178342657e363524ce8488dd072368a0aa8cc091a24912d6f8b6b0f4f2d'
            '2e9074203c67bc7ad98621c551047e5367f06e54cacfecc755a5bf2c9f99266eab42ad972f86ae28ed7e1507f6d27d8d2680a87ce9fd5b1e93a18bcb627ec3f0'
            'ca7a350bdeecf65dbca7de8d6912c935c6ba603edcddcd4ffe71d8997e50e4046335dde6d1d7c629d35025073d18be4d112a960d43a8801de979687bc26e46d4'
            'ede87db7e1ce67184409123720b48f65d35884bac5dfff34cc099c5d7520fd9173be00997df82ad29da4640928134a7199ffdd1cbaa83a72101dbed72736508b'
            'e58cc72194b69999f96f08585a41470c0d1c074bc03992a9b41ac3d1bf3f676e526c2b42191e4d0c511281467445b13c1da82a26aeed271e05eb79efad30459e'
            '44354df2fafcc9c08901a94d3d3eb8fe0a818d493b438799bdb75339c3fd9db91ccf9be2073271c1381496789819d74daf9353b28ab7e6a381db0d4f5ee41939')
prepare() {
  cd "${srcdir}/MultiMC5-${pkgver}"

  patch -p1 < "${srcdir}/modern-java.patch"
  patch -p1 < "${srcdir}/add-limits-header.patch"
  patch -p1 < "${srcdir}/konamicode-fix-type-mismatch.patch"

  rmdir "libraries/libnbtplusplus" 2>/dev/null || true
  ln -sfT "${srcdir}/libnbtplusplus-${__pkgver_libnbtplusplus}/" \
    "libraries/libnbtplusplus"

  rmdir "libraries/quazip" 2>/dev/null || true
  ln -sfT "${srcdir}/quazip-${__pkgver_quazip}/" \
    "libraries/quazip"

  cd "libraries/quazip"
  # https://github.com/MultiMC/quazip/pull/1
  patch -p1 < "${srcdir}/quazip-fix-build-with-qt-511.patch"
}

build() {
  cd "${srcdir}/MultiMC5-${pkgver}"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DMultiMC_UPDATER=OFF \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DMultiMC_LAYOUT=lin-system \
    ..
  make
}

check() {
  cd "${srcdir}/MultiMC5-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/MultiMC5-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/MultiMC5-${pkgver}/application/resources/multimc/scalable/multimc.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -D "${srcdir}/MultiMC5-${pkgver}/application/package/linux/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
  install -D "${srcdir}/MultiMC5-${pkgver}/build/libMultiMC_quazip.so" "${pkgdir}/usr/lib/libMultiMC_quazip.so"
  install -D "${srcdir}/MultiMC5-${pkgver}/build/libMultiMC_nbt++.so" "${pkgdir}/usr/lib/libMultiMC_nbt++.so"
}
