# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-standard
pkgver=3.3396.1779.g36f9eab
pkgrel=1
pkgdesc="Chromium Embedded Framework standard release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "atk" "pango" "libxrandr" "libxcursor" "libxss" "libxtst" "libxcomposite" "libglvnd" "dbus")
makedepends=("cmake" "make")
provides=("cef" "cef-minimal")
conflicts=("cef-minimal" "cef-git")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}_linux32.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}_linux64.tar.bz2"
)
sha1sums_i686=('6e97690b37e4b4a4f7334e6dab8668855e73f7ef')
sha1sums_x86_64=('0bd4d3783cce76b3a80151e5db57fa6e3232905a')
[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"
build() {
    cd "$srcdir"/cef_binary_${pkgver}_linux${_arch}
    sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
    cmake .
    make clean
    make libcef_dll_wrapper
}
package() {
    install -dm755 "$pkgdir"/opt/cef/
    cp -R "$srcdir"/cef_binary_${pkgver}_linux${_arch}/* "$pkgdir"/opt/cef/
    install -Dm644 "$srcdir"/cef_binary_${pkgver}_linux${_arch}/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
