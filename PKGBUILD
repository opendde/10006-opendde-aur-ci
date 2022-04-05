# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>

pkgname=franz-bin
pkgver=5.9.1
pkgrel=1
pkgdesc='Franz is a free messaging app for services like WhatsApp, Slack, Messenger and many more'
arch=('x86_64')
url='https://meetfranz.com'
license=('Apache')
depends=('gtk3' 'libxss' 'nss')
optdepends=('org.freedesktop.secrets: Keyring password store support')
conflicts=('franz')
options=('!strip' '!emptydirs')
source=("https://github.com/meetfranz/franz/releases/download/v${pkgver//_/-}/franz_${pkgver//_/-}_amd64.deb"
        "${pkgname}.patch")
b2sums=('d32dee1c3370213fa883891aeddbe2f48fa52e5fad8ffb03fe7b42c9f0f49591a93eb122d7c4dd2d035c332f335189be769107660b2a86dca04950159ebfded6'
        '4858e42f18b33ae58da2871bf7ba654ebd49c98ebfe13631355b8b0534ae8cd5558f5f7903fbe51791cc069ed3cccdb9519561dce38d2ed98090d00c703cfb3a')

package() {
  # Extract package data
  bsdtar -xJf data.tar.xz

  # Install package data
  mv "usr" "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  mv "opt/Franz" "${pkgdir}/usr/lib/franz"
  ln -s "../lib/franz/franz" "${pkgdir}/usr/bin/franz"

  # Permission fix
  chmod 644 "${pkgdir}/usr/lib/franz/"*.so

  # Fix binary path in .desktop file
  patch -d "${pkgdir}" -p1 <"${pkgname}".patch

  # Link licenses
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/franz/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "/usr/lib/franz/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
