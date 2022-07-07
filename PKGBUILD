# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=ente-desktop-appimage

pkgname="${_pkgname}"
pkgver=1.4.1
pkgrel=1
pkgdesc="Secure backups for photos and videos"
arch=('x86_64')
url="https://ente.io/"
license=('GPL')
depends=('libnotify' 'libappindicator-gtk3' 'fuse2' 'fuse3' 'fuse-common' 'libsecret')
_appimage="ente-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/ente-io/bhari-frame/releases/download/v${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('a0bf1a8cade88c083be12f0239eb006765f21d30449bafac6fef857076e15aaa')
options+=('!strip')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
