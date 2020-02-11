# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=openra-raplus-git
_pkgname=openra-raplus
pkgver=17.git.9e341a0
pkgrel=1
pkgdesc="A Command & Conquer: Red Alert-inspired mod of OpenRA"
arch=('any')
url="https://github.com/MlemandPurrs/raplusmod"
license=('GPL3')
install=openra-raplus.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('dos2unix' 'git' 'unzip' 'msbuild')
provides=('openra-raplus')
options=(!strip)
source=("git+${url}.git"
"local://GeoLite2-Country.mmdb.gz"
"openra-raplus"
"fetch-engine.patch"
"Makefile.patch"
"openra-raplus.appdata.xml"
"openra-raplus.desktop")
md5sums=('SKIP'
         'efb8c043dfa095146f373fec367aef64'
         'd48259a154b7a72b2377ac1a632ec1d3'
         '711019044fbb1c1e3aa5edc58b54343d'
         'feae017ba5765215cd151a892362e6b1'
         'e79c9aebc225384175810be58d9f9ddf'
         '9400d5c8bea3196e9af96f6aa5c2f879')

pkgver() {
    cd $srcdir/raplusmod
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

prepare() {
    cd $srcdir/raplusmod
    dos2unix *.md
    find . -name "*.sh" -exec chmod +x {} \;
    patch -Np1 -i $srcdir/fetch-engine.patch
    printf "Success in converting docs...\n"
}

build() {
    cd $srcdir/raplusmod
    make version VERSION="${pkgver}"
    printf "Success in setting version\n"
    make || (printf "make failed; please do not complain at the AUR about this, as this is an upstream issue.\n" && \
	printf "So report this at https://github.com/MustaphaTR/raplusmod/issues/new, after checking\n" && \
	printf "for existing issues.\n")
}

package() {
    cd $srcdir/raplusmod
    mkdir -p $pkgdir/usr/{lib/openra-raplus/mods,bin,share/pixmaps,share/doc/packages/openra-raplus,share/applications,share/appdata}
    install -dm775 $pkgdir/var/games/openra-raplus
    cp -r engine/* $pkgdir/usr/lib/openra-raplus
    cp -r mods/raplus $pkgdir/usr/lib/openra-raplus/mods
    cp -r engine/mods/{ra,common,modcontent} $pkgdir/usr/lib/openra-raplus/mods
    install -Dm755 $srcdir/openra-raplus $pkgdir/usr/bin/openra-raplus
    cp -r $srcdir/openra-raplus.appdata.xml $pkgdir/usr/share/appdata/openra-raplus.appdata.xml
    cp -r README.md $pkgdir/usr/share/doc/packages/openra-raplus/README.md
    cp -r mods/raplus/icon.png $pkgdir/usr/share/pixmaps/openra-raplus.png
    install -Dm644 $srcdir/openra-raplus.desktop $pkgdir/usr/share/applications/openra-raplus.desktop
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,64x64,128x128,256x256}/apps
    for size in 16 32 48 64 128 256; do
      size="${size}x${size}"
      cp packaging/linux/mod_${size}.png "$pkgdir/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    rm -rf $pkgdir/usr/lib/openra-raplus/*{.txt,nunit,.yml,.xslt,.cmd,.md,Mono,.sh,Makefile,sln.*,Test,.mdb,.pdb,.ps1,.AS,packaging,thirdparty,engines,OpenRA.Mods}*
    rm -rf $pkgdir/usr/lib/openra-raplus/{mods/{all,cnc,d2k,ra,ts},OpenRA.Mods.*,OpenRA.Platforms.Default,OpenRA.Server,OpenRA.Game,OpenRA.Utility,Settings.StyleCop}
}
