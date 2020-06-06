# Maintainer: Francisco Guimaraes <francisco at gmail dot com>

pkgname=whatsapp-nativefier-dark
pkgver=1.1.0
pkgrel=1
pkgdesc="WhatsApp desktop built with nativefier (electron) using dark theme"
arch=("armv7l" "i686" "x86_64")
url="https://web.whatsapp.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "yarn")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-inject.js"
  "package.json"
  "yarn.lock")
sha256sums=(
  "f79228902c35740ba202fc74494b3fa851911e466955298b231d7fcfebc63b37"
  "12b72fd82fff48dc8c5a08f7bc070259b9929cf408bf6738133a08508e4d3d09"
  "57fef7d701d3cf68d7d8b96392a2d53541fcd25ed4bd79cdd5cedfc3efb40926"
  "6b214b951ff556fe2b87bb66bf8d3eb7b8ae7ed1dd0ceef0fa9d2c4ca86e0fff"
  "77c85afca5dcea2a041a9461ead9700067556f95dc3702602c074260c4d3f047"
)
iconsha256sum=${sha256sums[0]}
tmpdesktopfile="/tmp/whatsapp-nativefier-dark.desktop"

build() {
  cd "${srcdir}"
  yarn && yarn nativefier \
    --name "WhatsApp" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --background-color "#1f232a" \
    --inject "${pkgname}-inject.js" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/WhatsApp-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/WhatsApp" "${pkgdir}/usr/bin/${pkgname}"
  sed "s/Icon=whatsapp-nativefier-dark/Icon=${iconsha256sum}/g" "${srcdir}/${pkgname}.desktop" > "${tmpdesktopfile}"

  install -Dm644 "${tmpdesktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${iconsha256sum}.png"
  done
}
