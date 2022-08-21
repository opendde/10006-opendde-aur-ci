# Maintainer: Piotr Grabowski <fau999@gmail.com>
_pkgname='kamite'
pkgname="${_pkgname}-bin"
pkgver=0.5
pkgrel=1
_gitname="v${pkgver}"
_archivename="Kamite_${pkgver}_Linux.zip"
pkgdesc="A language immersion companion for learners of Japanese"
arch=('x86_64')
url="https://github.com/fauu/Kamite"
license=('AGPL3')
depends=()
optdepends=(
  'slop: OCR support on Xorg'
  'slurp: OCR support on wlroots'
  'grim: OCR support on wlroots'
  'wlrctl: OCR Auto Block Instant mode support on wlroots'
  'mpv: media playback integration'
  'tesseract: Tesseract OCR engine'
)
provides=()
conflicts=()
source=(
    https://github.com/fauu/Kamite/releases/download/"${_gitname}"/"${_archivename}"
)
b2sums=('2d223c0e4334df3dc250f387af1081074cde3879cbcf3d19fa869f63f0e4c94f2fb9ed6969e72879247ab80510d1a73b61072fed499bbb3c7a70909c47a4fafb')

package() {
    cd "${srcdir}"/"${_pkgname}"

    # Icons
    for res in 16 32 48 128 256; do
      install -Dm644 res/icon/icon-"${res}".png \
                      "${pkgdir}"/usr/share/icons/hicolor/"${res}"x"${res}"/apps/"${_pkgname}".png
    done

    # Desktop file
    install -Dm644 res/"${_pkgname}".desktop "${pkgdir}"/usr/share/applications/"${_pkgname}".desktop

    rm -r res/
    rm install.sh

    cd ..

    # Program directory
    install -d "${pkgdir}"/opt/"${_pkgname}"
    mv "${_pkgname}" "${pkgdir}"/opt/

    # Launcher link
    install -d "${pkgdir}"/usr/bin
    ln -s /opt/"${_pkgname}"/bin/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
}

