# Maintainer: Patrick Ziegler <p.ziegler96@gmail.com>
pkgname=polybar
pkgver=3.6.3
pkgrel=1
pkgdesc="A fast and easy-to-use status bar"
# aarch64 is not officially supported by polybar, it is only listed here for convenience
arch=("i686" "x86_64" "aarch64")
url="https://github.com/polybar/polybar"
license=("MIT")
depends=("libuv" "cairo" "xcb-util-image" "xcb-util-wm" "xcb-util-xrm"
         "xcb-util-cursor" "alsa-lib" "libpulse" "libmpdclient" "libnl"
         "jsoncpp" "curl")
optdepends=("i3-wm: i3 module support")
makedepends=("cmake" "python" "pkg-config" "python-sphinx" "python-packaging" "i3-wm")
backup=("etc/polybar/config.ini")
conflicts=("polybar-git")
source=(${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f25758573567208fc7b6f4d4115a6117a87389cbcc094cf605d079775be95fa5')
_dir="${pkgname}-${pkgver}"

prepare() {
  mkdir -p "${_dir}/build"
}

build() {
  cd "${_dir}/build" || exit 1
  # Force cmake to use system python (to detect xcbgen)
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
  cmake --build .
}

package() {
  cmake --build "${_dir}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
