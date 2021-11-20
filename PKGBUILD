# Maintainer: Vladimir Svyatski <vsvyatski@yandex.ru>
# Previous Maintainer: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Previous Maintainer: Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: gspu <bssbk2455@gmail.com>
# Previous Maintainer: Uncle Hunto <unclehunto@yahoo.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-gtk2-bin
pkgver=8.3.0
pkgrel=4
pkgdesc='PeaZip file manager and archiver (GTK 2)'
arch=('x86_64')
url='https://peazip.github.io'
license=('LGPL3')
depends=('gtk2')
options=('!emptydirs')
optdepends=('p7zip: Command-line file archiver with high compression ratio'
            'quad: High-performance file compressor that utilizes an advanced LZ-based compression algorithm'
            'arc: Arc file archiver and compressor'
            'zpaq: Programmable file compressor, library and utilities'
            'paq8o: PAQ8 series of archivers, resurrected by new maintainers'
            'upx: Extendable, high-performance executable packer for several executable formats')
provides=('peazip')
conflicts=('peazip-qt-bin' 'peazip-qt5' 'peazip-qt5-bin')
source=("https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip-${pkgver}.LINUX.GTK2-1.${CARCH}.rpm")
sha256sums=('9b962a64b61d7421a49884d25166ab4e56a038daee583c70b74151ea8924c307')
changelog=changelog.txt

prepare() {
  rm -r usr/lib/.build-id
  # 7z.sfx is a Windows executable
  rm usr/lib/peazip/res/bin/7z/7z.sfx

  local sharedUsr=usr/share
  local sharedPeaZip="${sharedUsr}/peazip"
  # Windows related stuff
  rm "${sharedPeaZip}/readme/readme_Windows.txt"
  rm "${sharedPeaZip}/batch/"*.bat
  rm -r "${sharedPeaZip}/batch/SendTo"
  # KDE 3? You must be kidding.
  rm -r "${sharedPeaZip}/batch/freedesktop_integration/KDE-servicemenus/KDE3-konqueror"

  # setting correct permissions
  chmod 755 usr && chmod 755 usr/bin
  chmod 755 usr/lib && chmod 755 usr/lib/peazip
  chmod 755 usr/lib/peazip/res && chmod -R 755 usr/lib/peazip/res/bin
  chmod -x usr/lib/peazip/res/bin/7z/*.so
  chmod -x usr/lib/peazip/res/bin/7z/Codecs/*.so
  chmod 755 "${sharedUsr}"
  for subDir in "${sharedUsr}"/*; do chmod 755 "${subDir}"; done
  chmod 755 "${sharedUsr}/doc/peazip"
  for subDir in "${sharedPeaZip}"/*; do
    if [ -d "${subDir}" ]; then
      chmod 755 $(find "${subDir}" -type d)
    fi
  done
}

package() {
  mkdir "${pkgdir}/usr"
  cp -aR usr/bin/ "${pkgdir}/usr"
  cp -aR usr/lib/ "${pkgdir}/usr"
  cp -aR usr/share/ "${pkgdir}/usr"
}
