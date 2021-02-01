# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Tom <reztho at archlinux dot us>

_pkgname=pdfsam
pkgname=${_pkgname}-bin
pkgver=4.2.2
pkgrel=1
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="https://www.pdfsam.org/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'java-environment>=11' 'sh')
makedepends=('desktop-file-utils' 'gendesk')
source=("https://github.com/torakiki/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz"
        "pdfsam")
noextract=("${_pkgname}-${pkgver}-linux.tar.gz")

prepare() {
  mkdir -p "${_pkgname}-${pkgver}-linux"
  bsdtar -xzf "${_pkgname}-${pkgver}-linux.tar.gz" -C "${_pkgname}-${pkgver}-linux"
  # create *.desktop file
  gendesk -f -n \
          --pkgname="${_pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="PDFsam" \
          --categories="Office"

  # extract icons
  bsdtar -xf ${_pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/pdfsam-basic-${pkgver}.jar images/basic
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/${_pkgname}/lib"
  install -Dm644 "${_pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/pdfsam-basic-${pkgver}.jar" \
                 "${pkgdir}/usr/share/java/${_pkgname}/"
  install -Dm644 "${_pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/lib/"* \
                 "${pkgdir}/usr/share/java/${_pkgname}/lib"
  install -Dm755 "${_pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/bin/pdfsam.sh" \
                 "${pkgdir}/usr/share/java/${_pkgname}/bin/pdfsam.sh"

  # exec
  install -Dm755 "pdfsam" "${pkgdir}/usr/bin/pdfsam"

  # icons
  for _icon in 16 24 32 48 64 96 128 256 512; do
      install -Dm644 images/basic/${_icon}x${_icon}.png \
        "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png"
  done

  # desktop
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

sha512sums=('dc97b52a8dea4c394034316e79ae2604c8ba5aec8d8cc80ca38f4c7d6c71539927977466b52ca565042fc4cbcd270b457932535f0be8d25e3ac04982574b229d'
            'c0d8665e8f0a82e539cd70972f95f819d13b10166f1e4bb04d032d108ef5de45fe77f8716e8e2f0fa129e7042907928bde1d947cc54f691aa6d87a76dfaa10c1')
