# Maintainer: Anderson Rocha <anderson2320@gmail.com>
# Contributor: NexAdn <nexadn@yandex.com>

pkgname=cef-minimal
pkgver="96.0.18"
_pkgcommit="gfe551e4"
_chromiumver="96.0.4664.110"
_pkgver="${pkgver}+${_pkgcommit}+chromium-${_chromiumver}"
_url_pkgver="${pkgver}%2B${_pkgcommit}%2Bchromium-${_chromiumver}"
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "libxtst" "libglvnd" "pango" "libxcursor" "dbus" "libxrandr" "libxcomposite" "at-spi2-atk")
makedepends=("cmake" "make")
provides=("cef")
conflicts=("cef-standard" "cef-git")
cdn_build_package_url="https://cef-builds.spotifycdn.com"

source_i686=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux32_minimal.tar.bz2"
)
source_x86_64=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux64_minimal.tar.bz2"
)

sha1sums_i686=("f2954ea8a01b09f0c10aa7880171f8bfbd93e43e")
sha1sums_x86_64=("2f944adae71dd1a6c4d795373166a09f543c7cbd")

[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"

build() {
  cd "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal
  sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake

  CMAKE_BUILD_TYPE=Release cmake .
  CMAKE_BUILD_TYPE=Release make libcef_dll_wrapper
}

package() {
  mkdir -p "$pkgdir"/opt/cef/
  cp -R "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef
  install -Dm644 "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE

  # Fix read permissions
  chmod 644 "$pkgdir"/opt/cef/libcef_dll_wrapper/libcef_dll_wrapper.a
}
