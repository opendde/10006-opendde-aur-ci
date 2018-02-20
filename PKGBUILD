# Maintainer: Jason Stryker <public at jasonstryker dot com>
# Contributor: Christophe Robin <crobin@nekoo.com>
pkgname=runelite
pkgver=1.4.1
pkgrel=1
pkgdesc="Open source Old School RuneScape client."
arch=(any)
license=('BSD')
url="https://runelite.net/"
depends=('java-runtime>=8' 'xorg-xrandr' 'ttf-font')
noextract=('runelite.jar')
source=(runelite https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.jar
         runelite.desktop runelite.png)
sha512sums=('0332a16ba4e1195732d0c3c4278a2cba9646e173c4a4173db48236924710913370060fd8fa7f9ff548b69174c02a0b243930d8a3db34b5e8b02d281fe399329d'
			'b676acb24b6dfd89e562b8ef798539e2cb731afbf35be4fefc74f27f05e2e1b1a67cf187fe1e1cf8c518da83a25be7a2f823a6ba701080add63381f81c2836a6'
            'e00339514623c2f683118f1cdba93cebbc0761fd72f31e2d139ed467b8c41a6738fd0f27ac2beba4d2caa2a365ef4cc49a43af54b13ca5a908e5fd11d03f4bc1'
            'fe73d666eec61a8ac0059a56a417d3a22ccdc0d09eb567a613469af513318f4284ee70079a4d18d74cd3423c4d75ce5bb0a3c6df9f9f4532f8d5833ffe4a34ce')

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/runelite"         "${pkgdir}/usr/bin/runelite"
    install -D -m644 "${srcdir}/RuneLite.jar"     "${pkgdir}/usr/share/runelite/RuneLite.jar"
    install -D -m644 "${srcdir}/runelite.desktop" "${pkgdir}/usr/share/applications/runelite.desktop"
    install -D -m644 "${srcdir}/runelite.png"     "${pkgdir}/usr/share/pixmaps/runelite.png"
}
