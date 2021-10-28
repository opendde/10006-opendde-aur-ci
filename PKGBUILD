# Maintainer: Sergey Feschukov <snfesh@gmail.com>
# Adapted from Dave Parrish's "A Better PKGBUILD Template for AppImage Packages"

_pkgname=electrum-ravencoin
pkgname="${_pkgname}"-appimage
pkgver=0.4.4
_pkgver=v"${pkgver}"
pkgrel=1
pkgdesc="Electrum Ravencoin Wallet Client. Forked from the Electrum Bitcoin base client"
arch=('x86_64')
url="https://github.com/Electrum-RVN-SIG/electrum-ravencoin"
license=('MIT')
provides=('electrum-ravencoin')
conflicts=('electrum-ravencoin' 'electrum-ravencoin-git')
options=(!strip)
_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"

source=("https://github.com/Electrum-RVN-SIG/electrum-ravencoin/releases/download/${_pkgver}/${_appimage}"
        "${_pkgname}-${pkgver}-LICENCE::https://raw.githubusercontent.com/Electrum-RVN-SIG/${_pkgname}/${_pkgver}/LICENCE"
        )

b2sums=('8529c8edfff7695f2a7be1909c22d32da293a9a3263477fd8c728b8ae0ec0c100fac609a396a2c3b0f424858d3d8fbe8fcf11ce6f70492b167245096f3d41a4f'
        'a70dea849f4af001369ba2d35bc79c86d8212f0511f86d6f86f88ba0372ba72ef2ef9e2cee176ca5c85cd8c7fd65a95ed388d11cfb8314252d9c8a7ab66c6110')

noextract=("${_appimage}")

prepare() {
    # Bypass integration
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract &>/dev/null
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}-${pkgver}-LICENCE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons"
    cp "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
