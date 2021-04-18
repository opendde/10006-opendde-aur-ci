# Maintainer: Joaqim Planstedt <aur@joaqim.xyz>

pkgname=allusion-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="Allusion is a tool built for artists, aimed to help you organize your Visual Library – A single place that contains your entire collection of references, inspiration and any other kinds of images."
arch=('x86_64')
url='https://allusion-app.github.io'
license=('GNU')
depends=('glibc' 'zlib')
options=(!strip)
gitver="${pkgver}-rc2"
source_x86_64=("Allusion-${gitver}.AppImage::https://github.com/allusion-app/Allusion/releases/download/v${gitver}/Allusion-${gitver}.AppImage")
noextract=("Allusion-${gitver}.AppImage")
sha256sums_x86_64=('6d4e79d5c56f20fd326b9001737c79ee5f9fea2fc94864e1ed84a087572f22d3')

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/Allusion-${gitver}.AppImage" "${pkgdir}/opt/${pkgname}/Allusion.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Allusion.AppImage" "${pkgdir}/usr/bin/allusion"
}
