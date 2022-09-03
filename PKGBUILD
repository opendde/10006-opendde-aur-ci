# Maintainer: iTrooz_ <itrooz at protonmail dot com>
pkgname=imhex-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="A Hex Editor for Reverse Engineers, Programmers and people who value their retinas when working at 3 AM. "
arch=("x86_64")
url="https://github.com/WerWolv/ImHex"
repo=$url
license=('GPL 2.0')
groups=()
depends=(glfw mbedtls python freetype2 libglvnd dbus xdg-desktop-portal curl fmt yara nlohmann-json)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(imhex)
conflicts=(imhex)
replaces=()
backup=()
options=()
source=($repo"/releases/download/v$pkgver/imhex-$pkgver-ArchLinux.pkg.tar.zst")
noextract=()
md5sums=(dd7c15361248126ffda7aa5e7ff3fb75)
validpgpkeys=()

package() {
    tar -xf imhex-$pkgver-ArchLinux.pkg.tar.zst

    install -DT $srcdir/usr/bin/imhex $pkgdir/usr/bin/imhex
    install -DT $srcdir/usr/lib/libimhex.so.$pkgver $pkgdir/usr/lib/libimhex.so.$pkgver

    for plugin in $srcdir/usr/lib/imhex/plugins/*.hexplug;
    do
	    install -DT $plugin $pkgdir/usr/lib/imhex/plugins/`basename $plugin`
    done

    mkdir -p $pkgdir/usr/share/imhex
	cp -r $srcdir/usr/share/imhex/{constants,encodings,includes,magic,patterns} $pkgdir/usr/share/imhex
	cp -r $srcdir/usr/share/{applications,licenses} $pkgdir/usr/share
    install -d $pkgdir/usr/share
}
