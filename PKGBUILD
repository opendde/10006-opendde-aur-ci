# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Sebastian Jug <seb AT stianj DOT ug>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-es'
pkgver='6.5.2'
_language='es-ES'
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor (es-ES version)'
url='https://www.torproject.org/projects/torbrowser.html'
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
            'kdialog: KDE dialog boxes'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'libpulse: PulseAudio audio driver'
            'libnotify: Gnome dialog boxes')
install="${pkgname}.install"
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')
source=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"{,.asc}
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
sha512sums=('bc350985865d14ff1ea9f0186a222ea75cbd72f94514ace45dd78a70d78c4e9e62212aa6e190bd55345a73b9d6381aa3bb574e3450c4220bd7541457b31a1904'
            'SKIP'
            'ea785893bfec7e5d0c5caf6f73a119950f12751cec39186bb2335f410f30e207f43f7bc0bb9bac583d811d21e91157fd76dbdd6c6256ff680c065f477b8bb486'
            '0a68a0a8cfeea630a91036d86b167cf640ab378e64e0d8ab55e9f99cde3c9d6a2d762ea0f5528f8a8e1579600fcc59eaa72ba499d95daeb4334e81ab644bfb02'
            '87ceaa0fc03e43bd5cd591514ca9f5ad583982a80607180c8e3633ceb76de8a39e49fe37eb7f407e1e4c24ac4e6954b328699cbd714884bd80b6a0ef243e0946')
noextract=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")

package() {
   cd "${srcdir}"

   sed -i "s/REPL_NAME/${pkgname}/g"       ${pkgname}.sh
   sed -i "s/REPL_VERSION/${pkgver}/g"	    ${pkgname}.sh
   sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.sh

   sed -i "s/REPL_NAME/${pkgname}/g"       ${pkgname}.desktop
   sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.desktop
   sed -i "s/REPL_COMMENT/${pkgdesc}/g"    ${pkgname}.desktop

   install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
   install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   install -Dm 755 ${pkgname}.sh           ${pkgdir}/usr/bin/${pkgname}

   install -Dm 644 tor-browser-linux64-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux64-${pkgver}_${_language}.tar.xz
}
