# Maintainer: Mikhail Velichko  <efklid@gmail.com>



_pkgname=browser-stable
pkgname=yandex-browser
pkgver=22.7.5.1034_1
_pkgver=22.7.5.1034-1
pkgrel=1
#epoch=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser)
conflicts=('yandex-browser' 'yandex-browser-stable')
options=(!strip)

depends=( "binutils" "curl" "ttf-liberation" "jq" "alsa-lib" "libcurl-compat" "libcurl-gnutls" "gtk2" "gtk3" "gtk4" "snappy" "opus" "flac" "harfbuzz-icu" "nss"
"libxss" "libxkbfile" "wget" "xdg-utils" "polkit" "dbus-glib" "python" )
optdepends=(
    "speech-dispatcher"
    "vulkan-driver"
    "vulkan-icd-loader"
    "ttf-font"
    "cryptopro-csp-k1"
)

source=("${pkgname}-${pkgver}.deb::https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-${_pkgname}/yandex-${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=("8fd606608c8735775ac6a0295a1b8963413ec47613737a81a281db5ef2f216c3")
install=yandex-browser.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
# The stable version uses the "browser" folder in /opt/yandex. ${_pkgname} cannot be used in this section for the stable branch 
    install -D -m0644 "${pkgdir}"/opt/yandex/browser/product_logo_128.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
