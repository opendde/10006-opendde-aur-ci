# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk
pkgver=0.3.1_r475
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk"
license=("MPL2")
depends=("java-runtime")
provides=("tachidesk")
conflicts=("tachidesk-preview")
_semver=$(printf v${pkgver} | cut -d'_' -f1)
_commit=$(printf ${pkgver} | cut -d'_' -f2)
_jar=Tachidesk-${_semver}-${_commit}.jar

source=("${url}/releases/download/${_semver}/${_jar}" 
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('20bc6d1635c45fe6f1ae6c8fa497bd13'
         '728182fd92daa4e50b98c0d62bb65c5e'
         '520cdde66717d1701fb40dfbcdab59a2'
         '196d4e69879d3b01f73672c812c0f20c')

noextract=("${_jar}")

package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps" 
    install -d "${pkgdir}/usr/bin"
    
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${_jar}"          "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.png"   "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.sh"    "${pkgdir}/usr/bin/${pkgname}"
}
