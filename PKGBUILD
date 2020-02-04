# Before building this package:
# Download the Windows installer for the game off of GOG.com and put it in the
# same folder as this PKGBUILD.  Upstream recommends using the English version
# but other languages should work fine as well.  Rename the installer to
# "setup_albion.exe" (without the quotes).

# Maintainer: Pu Anlai
pkgname=albion-sr-gog
_pkgname=Albion-Linux
pkgver=1.6.1
pkgrel=1
pkgdesc="Linux port of the role-playing game albion using the GOG version"
arch=("x86_64")
url="https://github.com/M-HT/SR"
license=("GPL" "custom")
depends=("lib32-glibc" "lib32-sdl_mixer" "lib32-sdl" "lib32-libglvnd")
makedepends=("innoextract" "bchunk" "p7zip" "icoutils")
backup=("opt/ALBION/Albion.cfg")
install="albion-sr-gog.install"
source=("setup_albion.exe::gog://setup_albion.exe"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/M-HT/SR/releases/download/albion_v1.6.1/${_pkgname}-x86-v${pkgver}.tar.gz"
        "albion.desktop")
noextract=("${pkgname}-${pkgver}.tar.gz"
           "setup_albion.exe")
# don't download anything automatically to accomodate different language versions
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha1sums=(SKIP
          '0156acf6313c84c6e842af7e31ac7fbb732576d0'
          'b307af4b606f2510e1664ce96765cdc7f652bb06')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    tar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"

    mkdir -p $srcdir/gog-src
    innoextract -m -d $srcdir/gog-src --gog setup_albion.exe

    # get stuff from the bin image
    mkdir -p $srcdir/gog-cd
    bchunk $srcdir/gog-src/game.gog $srcdir/gog-src/game.ins game
    7z x -ogog-cd game*iso

    # get icons
    mkdir -p $srcdir/gog-icon
    icotool -x -p 0 $srcdir/gog-src/app/goggame-1436955815.ico -o $srcdir/gog-icon
}

package() {
    # get relevant folders from .../app
    mkdir -p $srcdir/gog-src/XLDLIBS/CURRENT

    # adapt SETUP.INI
    sed -ri 's/^SOURCE_PATH.+$/SOURCE_PATH=ALBIONCD\\/g' $srcdir/gog-src/SETUP.INI

    mkdir -p $pkgdir/opt/ALBION

    # copy files
    cp $srcdir/gog-src/{ALBI*,DOS4GW.EXE,INSTALL.*,MAIN.EXE,Readme.txt,SETUP.*,SYSTEXTS} $pkgdir/opt/ALBION/
    # copy folders
    cp -r $srcdir/gog-src/{DRIVERS,XLDLIBS} $pkgdir/opt/ALBION/

    # copy SR files
    cp -r $srcdir/${pkgname}-${pkgver}/* -t $pkgdir/opt/ALBION/

    # give universal access for everything but the CD files
    chmod -R 777 $pkgdir/opt/ALBION

    # copy contents of cd
    cp -r $srcdir/gog-cd/ALBION $pkgdir/opt/ALBION/ALBIONCD

    # install desktop file
    install -Dm 644 $srcdir/albion.desktop -t $pkgdir/usr/share/applications
    
    # install icons
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_1_16x16x32.png $pkgdir/usr/share/icons/hicolor/16x16/apps/albion.png
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_2_24x24x32.png $pkgdir/usr/share/icons/hicolor/24x24/apps/albion.png
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_3_32x32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/albion.png
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_4_48x48x32.png $pkgdir/usr/share/icons/hicolor/48x48/apps/albion.png
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_5_64x64x32.png $pkgdir/usr/share/icons/hicolor/64x64/apps/albion.png
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_6_128x128x32.png $pkgdir/usr/share/icons/hicolor/128x128/apps/albion.png
    install -Dm 644 $srcdir/gog-icon/goggame-1436955815_7_256x256x32.png $pkgdir/usr/share/icons/hicolor/256x256/apps/albion.png
}
