# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop
pkgver=3.2.1
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libcurl-compat' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('gnome-keyring')
source=("https://downloads.slack-edge.com/linux_releases/${pkgname}-${pkgver}-amd64.deb"
        "${pkgname}.patch")
sha256sums=('503995fe48cdb435a479669971e2a7ea7223428adc3c4f9fee94dbbdf9bcad24'
            'c952eb32dd59beff9fc5374853b04acde4a60ed8c39934fcd0b66829455d594d')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Fix hardcoded icon path in .desktop file
    patch -d "${pkgdir}" -p1 <"${pkgname}".patch

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
