# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Sebastian Jug <seb AT stianj DOT ug>

# To port this PKGBUILD to another language of tor-browser you 
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='7.0.2'
_language='en-US'
pkgrel=1
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
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
sha512sums=('feffb9746b764504c0b95b90b2f65581f18f4cc977bdd052e19146b1c71ed450ba1edeacd70bbff4b8741d4555eb65f373fb9431997e6e0e43b5d6b0021d4736' 'SKIP'
            'c476a7efe7114cf4edbfc8eeeb08ba7a2cfbcc6df09db8ca40db2a8a124ddece8bd07c575c5d0fb80ded6a74d3d8a66e3dbd9a85bb9f3488fc2f023ec10fc233'
            '0a68a0a8cfeea630a91036d86b167cf640ab378e64e0d8ab55e9f99cde3c9d6a2d762ea0f5528f8a8e1579600fcc59eaa72ba499d95daeb4334e81ab644bfb02'
            '87ceaa0fc03e43bd5cd591514ca9f5ad583982a80607180c8e3633ceb76de8a39e49fe37eb7f407e1e4c24ac4e6954b328699cbd714884bd80b6a0ef243e0946')
sha256sums=('19cf8b731aee721fa3f2d161b8a193a49a71fff344ea3f63573bfdee7745bc75' 'SKIP'
            '871f856dc8f0a7f273cbb9ba286fd744897ffcaf7308d15d58f2c8ec8baa981b'
            '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
            '1bca06dc844f000fd5aae91a082f0cc0f8ca3397dfbf88b0adc847a4e43e1f16')
md5sums=('4097d43aa0be86ae3fe43ec8f3ac5394' 'SKIP'
         '85d9e6237025b9e76a656342168140b6'
         '494afbfa60fb4ce21840244cc3f7208c'
         '3ef08aff0e2afebb1a2a7ffbf8f65897')
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
