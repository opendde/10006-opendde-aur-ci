# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=3dslicer-bin
_pkgname=3dslicer
pkgver=5.0.3
pkgrel=2
pkgdesc='A free, open source and multi-platform software package widely used for medical, biomedical, and related imaging research'
arch=('x86_64')
url='https://www.slicer.org'
license=('BSD')
depends=('dbus' 'glib2')
makedepends=('gendesk')
provides=('3dslicer')
conflicts=('3dslicer')
options=(!strip !emptydirs)
source=(
    "${_pkgname}-${pkgver}.tar.gz::http://download.slicer.org/download?os=linux&stability=release"
    "${_pkgname}.svg::https://www.slicer.org/assets/img/3D-Slicer-Mark.svg"
)
sha512sums=('4e4a94db19d5fd19f35c602a47a5ae7bfa7a4c6c0d9739ec9b68999de54520ffaa0cee85372a6cb7e9901575bfe6ccca0d08f0b9e06a2f7be195a821cd7b335d'
            '3422d244f819a7ec4c475d3d8a90c79fcb73738920c0830b100c6342ca24d5be607ba60ee3d91892402036a0adf31d5ab7c8fc83f451121a7b537f7de5306014')

prepare() {
# manually extract tarball due to their unpredicted name
  mkdir "${srcdir}/${_pkgname}"
  tar xvf "${srcdir}/${_pkgname}-${pkgver}.tar.gz" -C "${srcdir}/${_pkgname}" --strip-components 1

  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Graphics;MedicalSoftware;Science;" \
    --icon "${_pkgname}" \
    --exec "Slicer"
}

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  mv "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}"
  ln -s /opt/${_pkgname}/Slicer "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
# vim:set ts=2 sw=2 et:

