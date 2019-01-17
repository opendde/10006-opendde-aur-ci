#Maintainer AwesomeHaircut jesusbalbastro@gmail.com

pkgname=feedthebeast
pkgver=1.4.17
pkgrel=2
pkgdesc="Feed The Beast offers many different styles of Minecraft modpacks to the community, catering to all tastes."
arch=('any')
url='http://feed-the-beast.com/'
license=('Apache')
# libzip is needed for many modpacks.
depends=('java-runtime' 'hicolor-icon-theme' 'xorg-xrandr' 'ttf-dejavu' 'libzip')
makedepends=('libicns')
source=("$pkgname"
	"${pkgname}-$pkgver.jar"::"http://ftb.cursecdn.com/FTB2/launcher/FTB_Launcher.jar"
        "${pkgname}.desktop")
noextract=("${pkgname}-$pkgver.jar")
sha256sums=('35ebb0e4fc8a581c2aa6e939527f238800f4059bb5253c67eb3d478c463010b0'
            'f2ec575e3ffd92bac87caf8b306fc22d4ba78b19bf9577a2d915e9dedab2c030'
            '4dc05fcbad49c8d6d8d3143969c8f9c7e26d22ad72979f73c2d3c2b3a23a426d')

package() {
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}-$pkgver.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # icons are trapped inside .icns format, free them.
    bsdtar -xf "${pkgname}-$pkgver.jar" app/icon.icns
    icns2png -x app/icon.icns
    for size in 16 32 48 128 256; do
        install -Dm644 "icon_${size}x${size}x32.png" \
          "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
