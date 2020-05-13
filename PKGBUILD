# Maintainer: Yves Hoppe <contact@empoche.com>
# Maintainer: Guido de Gobbis <guido@degobbis.de>

pkgname=empoche
pkgrel=1
pkgver=0.3.3
pkgdesc="New Time Tracking and Task Management application."
url="https://empoche.com"
provides=('empoche')
arch=('x86_64')
license=('proprietary')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
source_x86_64=("https://empoche-desktop.s3.eu-central-1.amazonaws.com/empoche-${pkgver}.pacman")
sha256sums_x86_64=('7cc0345a3c50f91d549100ab188d22774a49ff40dab6ab8fd461bc20e85297f9')

package() {
    # Install in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/Empoche" "${pkgdir}/opt/"

    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install the icons
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done

    # Add a launch script
    printf '#!/usr/bin/bash\n\nXDG_DATA_DIRS=/usr/local/share/:/usr/share/ "/opt/Empoche/empoche"' > "${srcdir}/empoche"
    install -d "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/empoche" "${pkgdir}/usr/bin/"
}
