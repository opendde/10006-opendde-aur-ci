# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Giulio Guzzinati <guzzinati.giulio at gmail>
pkgname=imagej
pkgver=1.53e
_pkgver=153
_jar=ij-$pkgver.jar
pkgrel=1
epoch=2
pkgdesc="Image manipulation software for scientists"
arch=('any')
url="https://imagej.net"
license=('Public Domain')
depends=('java-runtime')
makedepends=('unzip')
optdepends=('java-environment-common')
source=("http://wsr.imagej.net/distros/cross-platform/ij$_pkgver.zip"
        "https://repo1.maven.org/maven2/net/imagej/ij/$pkgver/$_jar"
        "imagej.sh"
        "imagej.desktop"
        "microscope.xpm")
noextract=("ij$_pkgver.zip")
sha256sums=('0e1d66011ad713bc89a48f3121f544ad4d35aa0895010a84fe8ea3716de43ec4'
            '023c8afd14ad04ece99893b004d67fd91fd3261242d9b1846b4364622a52b24b'
            'c223a3b2437501edd92176f87bbea75d994104e1545eea6c120ef8c774c7114e'
            '799188b0b2cf1dc684dc2f029dbd31a4b44b691b51fd5e42027a994452bc038e'
            'fd1479568b116a276ca1f645589a8e37ccaf767736c6cc0dcec9672225a82572')

package() {
    cd "$pkgdir"
    unzip -d "$pkgdir" "$srcdir/ij$_pkgver.zip"
    rm -rf ImageJ/ImageJ.exe ImageJ/ImageJ.app ImageJ/run

    mkdir -p "$pkgdir"/usr/share
    mv ImageJ "$pkgdir"/usr/share/imagej
    install -m644 "$srcdir"/$_jar "$pkgdir"/usr/share/imagej/ij.jar

    find "$pkgdir" -type d -exec chmod 755 {} \; -o -exec chmod 644 {} \;

    cd "$srcdir"
    install -Dm755 imagej.sh "$pkgdir"/usr/bin/imagej
    install -Dm644 imagej.desktop "$pkgdir"/usr/share/applications/imagej.desktop
    install -Dm644 microscope.xpm "$pkgdir"/usr/share/pixmaps/microscope.xpm
}
