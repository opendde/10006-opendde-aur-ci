# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb-appimage
pkgver=0.1.4
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards (binary AppImage version)"
arch=('x86_64')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('librepcb')
conflicts=('librepcb')
_appimage="librepcb-${_pkgver}-linux-${arch[0]}.AppImage"
noextract=("${_appimage}")
options=('!strip' '!emptydirs')
source=(
  "https://download.librepcb.org/releases/${_pkgver}/${_appimage}"
  "https://download.librepcb.org/releases/${_pkgver}/${_appimage}.asc"
)
sha256sums=(
  'c70f2368c40a3fb87d8fc33cd0febc939a038f90b5b0d807337e0919164f6836'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

build() {
  chmod +x ${_appimage}
  ./${_appimage} --appimage-extract 2>/dev/null
  chmod -x ${_appimage}
}

package() {
  # Appimage
  install -D -m755 "${srcdir}/${_appimage}" "${pkgdir}/usr/local/bin/librepcb"

  # Metadata
  mkdir -p "${pkgdir}/usr/share"
  cp -R "squashfs-root/opt/share/applications" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/icons" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/metainfo" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/mime" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
