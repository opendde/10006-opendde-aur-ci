# Maintainer: Alec Mev <alec@mev.earth>

pkgname=webex-teams
pkgver=2020.08.20_3
pkgrel=2
pkgdesc='Webex Teams, conference software from Cisco.'
arch=('any')
url='https://www.webex.com'
license=('MIT')
depends=('electron')
makedepends=(
  'curl'
  'gendesk'
  'nodejs-nativefier'
)

_name="webex-teams"

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    -n \
    -f
  curl https://mediafiles.webex.com/content/dam/wbx/us/images/hp/hp_56565/Teams_Iconx2.png > "${pkgname}.png"
}

build() {
  cd "${srcdir}"
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --single-instance \
    --verbose \
    https://teams.webex.com
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  ## local _x=`echo "${_name}-linux-"*`
  cp -r "${srcdir}/resources/app" "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_x}/LICENSE"
  install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}
