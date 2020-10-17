# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=bluemail
pkgver=1.1.36
pkgrel=1
pkgdesc="BlueMail is a free, secure, universal email app, capable of managing an unlimited number of mail accounts"
arch=('x86_64')
url="https://www.bluemail.me"
license=('custom')
conflicts=('bluemail-bin')
provides=('bluemail')

depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss')
makedepends=('squashfs-tools' 'imagemagick')

# Get latest version + link from https://snapcraft.io/bluemail || snap info bluemail || run the following
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/bluemail | jq '.download_url' -r
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/bluemail | jq '.version' -r
source=('LICENSE'
        "${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/ZVlj0qw0GOFd5JgTfL8kk2Y5eIG1IpiH_43.snap")

sha512sums=('546994dbf25972659db6130402926020fdfc763b3f41580d812aeb785824218bae1204babe99af51ad91fd758ad0e7f4d0636a00e9130ce13fc6ebb90540e9dc'
            'ce91297db4203c3725d439bd29b9eb002eebc554114a3c81477a49ff98d2aa8b837fc04896c74960beb1d6ae092ab3a31b130f210a09203788cd4f0ebb31a1a8')

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    unsquashfs -f -d "${pkgdir}/opt/bluemail" "${pkgname}-${pkgver}.snap"

    chmod 755 "${pkgdir}/opt/bluemail"
    ln -sf /opt/bluemail/bluemail "${pkgdir}/usr/bin/bluemail"

    # Fix and install desktop icons
    for size in 22 24 32 48 64 128 256 512; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        convert "${pkgdir}/opt/bluemail/meta/gui/icon.png" -resize "${size}x${size}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/bluemail.png"
    done

    sed -ri 's/(Icon=).+/\1bluemail/' "${pkgdir}/opt/bluemail/meta/gui/bluemail.desktop"
    install -Dm644 "${pkgdir}/opt/bluemail/meta/gui/bluemail.desktop" "${pkgdir}/usr/share/applications/bluemail.desktop"

    # Cleanup snap vendor files and useless files
    rm -r "${pkgdir}/opt/bluemail/lib"
    rm -r "${pkgdir}/opt/bluemail/meta"
    rm -r "${pkgdir}/opt/bluemail/usr"
    rm ${pkgdir}/opt/bluemail/*.sh
    rm ${pkgdir}/opt/bluemail/libEGL.so
    rm ${pkgdir}/opt/bluemail/libGLESv2.so
}
