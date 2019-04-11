# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: CubeTheThird <cubethethird@gmail.com>

pkgname=amidstexporter
pkgver='1.44'
_jarfile='AmidstExporter.jar'
pkgrel=2
pkgdesc='Advanced Minecraft Interface and Data/Structure Tracking; fork with location export.'
arch=('any')
license=('GPL3')
url='http://www.buildingwithblocks.info/exportfromseed.html'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$_jarfile")
changelog=ChangeLog
source=("https://github.com/Treer/AMIDST/releases/download/v${pkgver}/${_jarfile}"
        amidstexporter.sh
        amidstexporter.desktop)
md5sums=('9c7a369c34aaa5cc48d7456706cfc989'
         '365558c0aadf7a879ff8f4514943b10c'
         'abe95f51b3ec61a2ae371a05c6edfc1f')

prepare() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --quiet --extract --make-directories --insecure 'amidst/resources/icon*.png' < "$_jarfile"
}

package() {
    cd "$srcdir"

    install -Dm755 'amidstexporter.sh'      "$pkgdir/usr/bin/amidstexporter"
    install -Dm644 'amidstexporter.desktop' "$pkgdir/usr/share/applications/amidstexporter.desktop"
    install -Dm644 "$_jarfile"              "$pkgdir/usr/share/java/$pkgname/$_jarfile"

    icon_sizes=(16 32 64)
    for s in "${icon_sizes[@]}"; do
        install -Dm644 "amidst/resources/icon${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/amidstexporter.png"
    done
}

# vim:set ts=4 sw=4 et:
