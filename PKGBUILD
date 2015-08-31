# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=openbor
pkgver=3.0.r4153
pkgrel=1
pkgdesc="An open source fighting video game and moddable game engine (aka Beats of Rage)"
arch=('i686' 'x86_64')
url="http://www.chronocrash.com"
license=('BSD')
depends=('bash' 'sdl2_gfx' 'libvorbis' 'libpng' 'libvpx')
makedepends=('subversion' 'yasm' 'imagemagick' 'glu')
optdepends=('libgl: OpenGL video mode')
install=openbor.install
source=(openbor::"svn+http://svn.code.sf.net/p/openbor/engine/engine#revision=${pkgver#*.r}"
        'openbor.desktop'
        'openbor.sh')
sha256sums=('SKIP'
            '92c2c8fa5727ddf76421bdb54589d898679b12f4201931f2861b7fa1b613097b'
            'fc584ea761ba1307e4568c2ffb78731b848d27ed231bdc2149ece96304a55d81')

prepare() {
  cd openbor

  # disable abort on warnings/errors
  sed 's/-Werror//' -i Makefile
  # disable RPATH
  sed 's/-Wl,-rpath,$(LIBRARIES)//' -i Makefile
  # verbose output
  #sed 's/@$(CC)/$(CC)/' -i Makefile
  # fix a locale warning
  sed 's|en_US.UTF-8|C|g' -i version.sh
  # convert icon
  convert -resize 48x48 resources/OpenBOR_Icon_128x128.png ../openbor.png

  # FIXME: wipe file so it does not redefine max_align_t
  echo "" > source/webmlib/halloc/align.h
}

build() {
  cd openbor

  # work around 'special' build system
  ./version.sh
  make SDKPATH=/usr LNXDEV=/usr/bin BUILD_LINUX=1 GCC_TARGET=$CARCH
}

package() {
  cd openbor

  # launcher + binary
  install -Dm755 ../openbor.sh "$pkgdir"/usr/bin/openbor
  install -Dm755 OpenBOR "$pkgdir"/usr/bin/OpenBOR.real
  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  # .desktop entry
  install -Dm644 ../openbor.desktop "$pkgdir"/usr/share/applications/openbor.desktop
  install -Dm644 ../openbor.png "$pkgdir"/usr/share/pixmaps/openbor.png
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
