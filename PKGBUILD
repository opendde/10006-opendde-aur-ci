# Maintainer: Joaqim Planstedt <aur@joaqim.xyz>

# Check for new releases: https://github.com/allusion-app/Allusion/releases
# or use:
# $ curl -sL $(curl -s https://github.com/allusion-app/Allusion/releases | sed -n -e "s/^.*\(\/allusion-app\/Allusion\/releases\/download\/.*\/latest-linux.yml\)\".*/https:\/\/github.com\1/p" | head -n1)

pkgname=allusion-appimage
pkgver=1.0.0
pkgrel=3
pkgdesc="Allusion is a tool built for artists, aimed to help you organize your Visual Library – A single place that contains your entire collection of references, inspiration and any other kinds of images."
arch=('x86_64')
url='https://allusion-app.github.io'
license=('GNU')
makedepends=('curl' 'sed')
depends=('glibc' 'zlib')
options=(!strip)
gittag=$(curl -s https://github.com/allusion-app/Allusion/releases | sed -n -e "s/^.*releases\/download\/v${pkgver}\(.*\)\/.*.AppImage\".*/\1/p" | head -n1)
gitver="${pkgver}${gittag}"
source_x86_64=("Allusion-${gitver}.AppImage::https://github.com/allusion-app/Allusion/releases/download/v${gitver}/Allusion-${gitver}.AppImage")
noextract=("Allusion-${gitver}.AppImage")
sha256sums_x86_64=("394e85d980e8e6fedf3ec885cd6b680b3fd740aaadedeb61b3b198c514688b15")

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/Allusion-${gitver}.AppImage" "${pkgdir}/opt/${pkgname}/Allusion.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Allusion.AppImage" "${pkgdir}/usr/bin/allusion"
}
