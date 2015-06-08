# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=tsmuxer-ng
pkgver=2.6.11
pkgrel=1
pkgdesc='Transport Stream muxer. New Generation (3D capable)'
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=168539"
license=('custom')
provides=('tsmuxer' 'tsmuxer-gui')
conflicts=('tsmuxer' 'tsmuxer-gui')
depends=('bash')
depends_i686=('gcc-libs' 'freetype2' 'qt4')
depends_x86_64=('lib32-gcc-libs' 'lib32-freetype2' 'lib32-qt4')
source=("tsmuxer-${pkgver}.tar.gz::https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download"
        "tsMuxerGUI.desktop"
        "tsMuxerGUI.png")
sha1sums=('aa3a7d45ddf4ca77b5e94c8602081ac0e56e4015'
          '6708b8ff7d7401e142a7d64c0fd588c365e009c1'
          '07a5eab9c7b3579d73bc80461ba566954f26d1e4')
install="tsmuxer-ng.install"
options=('!strip')

package() {
  install -Dm755 tsMuxeR "${pkgdir}/usr/bin/tsMuxeR"
  install -Dm755 tsMuxerGUI "${pkgdir}/usr/bin/tsMuxerGUI"

  install -Dm644 tsMuxerGUI.desktop "${pkgdir}/usr/share/applications/tsMuxerGUI.desktop"
  install -Dm644 tsMuxerGUI.png "${pkgdir}/usr/share/pixmaps/tsMuxerGUI.png"
}
