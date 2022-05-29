# Maintainer:  glatavento <glatavento  at outlook dot com>
# Contributor: sukanka    <su975853527 at gmail   dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=2.0.14
pkgrel=2
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('unknown')
depends=(electron14)
optdepends=('pandoc: docx export.')
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop")
sha512sums=('eec047f665a0de886caee56f2d486b68d9363636aeb34cc418dc04720308651a6d5af7ad24fd3e55a77625590fef9cebc9463262856572e6313be71ab2e42894'
            '423e88f4d7d06452f284803477b90e59f835bea7f1dc931a0e5fbaf596bcb68acdd7b545f01869f11424c76d9312aad51d915a57234781af2ed4eada0f745092'
            '4ca7d777c2dce64d89a874af268773009ba0ebe064c3ce0034913c447666bf6636a3c81d1145579fe1b0b6a35195b1f97b1b4cd56b50e990fb0642c4aae281f0')

package() {
    cd $srcdir 
    install -Dm755 ${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
    
    cd $srcdir/siyuan-${pkgver}-linux
    install -Dm644 resources/stage/icon.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
    mkdir -p ${pkgdir}/usr/lib
    mv resources ${pkgdir}/usr/lib/${_pkgname}
}
# vim: ts=2 sw=2 et:
