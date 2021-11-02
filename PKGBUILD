# Maintainer: Niklas Leinz <niklas[at]corusm[dot]de>

# TODO: Update 1.0.0 to $pkgver
# https://wiki.archlinux.org/title/AUR_submission_guidelines

pkgname="mouselogger-git"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="MouseLogger for University DataScience Project"
arch=("x86_64")
url="https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App"
license=("custom")
source=("https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App/archive/refs/tags/v1.0.0.tar.gz")
sha512sums=("SKIP")


package() {
    # Package
    mkdir -p "${pkgdir}/usr/bin"
    wget https://github.com/Studienarbeit-Mouse-Dynamics-DHBW-FN/MouseLogger-App/releases/download/v1.0.0/mouselogger-linux
    cp "${srcdir}/mouselogger-linux" "${pkgdir}/usr/bin/mouselogger"
    chmod +x "${pkgdir}/usr/bin/mouselogger"

    # Install Desktop File
    install -Dm644 "${srcdir}/MouseLogger-App-1.0.0/mouselogger.desktop" "$pkgdir/usr/share/applications/mouselogger.desktop"

    # Install Icon File
    install -Dm644 "${srcdir}/MouseLogger-App-1.0.0/mouselogger.png" "$pkgdir/usr/share/applications/mouselogger.png"
}
