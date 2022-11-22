# Maintainer: beliys <aur at bil dot co dot ua>
# based on lens-bin

_pkgname=OpenLens
pkgname=openlens-bin
pkgver=6.2.1
pkgrel=1
pkgdesc='The Kubernetes IDE (fork lens-bin without lenscloud-lens-extension). Read more - https://github.com/lensapp/lens/issues/5444'
arch=('x86_64' 'aarch64')
license=('MIT')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
provides=('lens')
conflicts=('lens' 'lens-bin')
source=("${_pkgname}.desktop")
source_x86_64=(${_pkgname}-${pkgver}-x86_64.AppImage::"https://github.com/beliys/OpenLens/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
source_aarch64=(${_pkgname}-${pkgver}-aarch64.AppImage::"https://github.com/beliys/OpenLens/releases/download/v${pkgver}/${_pkgname}-${pkgver}.arm64.AppImage")
sha256sums=('30ab2e9f91ca6be993b5893fb385a225c6d06f6d11caa305e0d109348b5d132c')
sha256sums_x86_64=('6095bbea91cedf6acc0f67a974af1ea0272f5b88bdd1d1ec3bc5050de88b0584')
sha256sums_aarch64=('778afca0fa183f5be451fac048df75794d7abb535e7212b0422468a0ae860155')

prepare() {
  chmod +x "${_pkgname}-${pkgver}-${CARCH}.AppImage"
  "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract
}

package() {
  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${_pkgname}
  mv "${srcdir}"/squashfs-root/* \
    "${pkgdir}"/usr/share/${_pkgname}

  # icon
  install -Dm 644 "${pkgdir}"/usr/share/${_pkgname}/usr/share/icons/hicolor/512x512/apps/open-lens.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/open-lens.png

  # desktop file
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/open-lens \
    "${pkgdir}"/usr/bin/open-lens

  # clean and fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/AppRun
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/lens.{desktop,png}
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/usr
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/resources/extensions/*/dist/*-arm64
}
