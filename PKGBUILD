# Maintainer: ssorgatem at gmail dot com

pkgname=superslicer-prerelease-bin
pkgver=2.3.56.5
_pkgtag=$pkgver
_appimage=SuperSlicer-ubuntu_18.04-$_pkgtag.AppImage
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (Creality, RepRap, Makerbot, Ultimaker etc.) (binary AppImage)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('zlib')
options=('!strip')
replaces=('slic3r++')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git' 'superslicer-prerelease')
source=("https://github.com/supermerill/SuperSlicer/releases/download/$_pkgtag/$_appimage"
        )
sha256sums=('ccb6bff6b6a266d6c16372af73f12331e7b1b31dd1f737397a4a88ca27e33c6f')
noextract=("${_appimage}")


prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/superslicer|"\
        "squashfs-root/Slic3r.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/resources
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/Slic3r.desktop"\
            "${pkgdir}/usr/share/applications/SuperSlicer.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/resources/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/superslicer"
}
