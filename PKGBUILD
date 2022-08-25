# Maintainer: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Original Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet
pkgver=35.0.3.0
pkgrel=2
pkgver_libffmpeg=0.67.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('i686' 'x86_64')
url="http://www.slimjet.com"
license=('custom:freeware')
depends=('gtk3' 'harfbuzz-icu' 'libxss' 'nss' 'ttf-font')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')
_channel=release
source_i686=("${pkgname}-30.0.0.5_i386.deb::http://www.slimjet.com/${_channel}/${pkgname}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.slimjet.com/${_channel}/${pkgname}_amd64.deb")
source=('LICENSE' "libffmpeg.zip::https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/${pkgver_libffmpeg}/${pkgver_libffmpeg}-linux-x64.zip")
md5sums=('e2f3d75bbf4ea8cef106adb30c6b4c83' '7a88814ccd43497867443d3e24f4ba89')
md5sums_i686=('dc3b1d6b986c23dcd8e3aac6a598d6f2')
md5sums_x86_64=('43C3B5BF9BC57F8346D6E56374EE0E77')

prepare() {
    bsdtar -xf data.tar.xz
    unzip -o libffmpeg.zip
}

package() {
    cp --parents -a {opt,usr/bin,usr/share} "${pkgdir}"

    # install license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install  "/${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install  "/${srcdir}/libffmpeg.so" "${pkgdir}/opt/slimjet/libffmpeg.so"

    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${i/x*}.png \
                       "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
