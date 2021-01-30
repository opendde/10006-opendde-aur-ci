# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=lx-music-desktop-appimage
pkgver=1.7.0
pkgrel=1
pkgdesc="A music assistant based on Electron + Vue."
arch=("x86_64")
url="https://github.com/lyswhut/lx-music-desktop"
license=("Apache" "custom")
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_filename="lx-music-desktop-v${pkgver}-x64.AppImage"
_launcher="lx-music-desktop.desktop"
provides=("lx-music-desktop=${pkgver}")
conflicts=('lx-music-desktop' 'lx-music-desktop-bin')
source=("https://github.com/lyswhut/lx-music-desktop/releases/download/v${pkgver}/${_filename}"
        ${_launcher})
noextract=(${_filename})
sha256sums=('60d48c94a096ba612a4759d09a0fe4ac11c5fdde463782e0e1b9f803b6e22f89'
            '88d199167894812929c2ed8a14451f8565c392ac63900d0deaa47a0c01257072')
_icon='/usr/share/icons/hicolor/512x512/apps/lx-music-desktop.png'
_licensedir=/usr/share/licenses/${pkgname}

prepare() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
}

package() {
    install -Dm755 ${_filename} "${pkgdir}/usr/bin/lx-music-desktop"
    install -Dm644 "${_launcher}" "${pkgdir}/usr/share/applications/${_launcher}"
    install -d ${pkgdir}/${_licensedir}
    install -m644 ${srcdir}/squashfs-root/resources/licenses/* ${pkgdir}/${_licensedir}
    install -Dm644 "${srcdir}/squashfs-root/${_icon}" "${pkgdir}/${_icon}"
}
