# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

_execname_=standard-notes
pkgname=sn-bin
pkgver=2.0.42
pkgrel=1
pkgdesc="A simple and private notes app."
arch=('x86_64')
url="https://github.com/standardnotes/desktop"
license=('GPL3')

# This conflicting package is currently marked out-of-date.
conflicts=('standardnotes-desktop')

source_x86_64=("${url}/releases/download/v${pkgver}/${_execname_}-${pkgver}-x86_64.AppImage"
               "${_execname_}.desktop"
               "${url}/raw/master/app/icon/Icon-512x512.png")

sha256sums_x86_64=('55aa58ebd78a4186d190895042009047c6b346626df185ddb478b54a2098f318'
                   '223db296b73d1bbb1ed9f468f368cfa1a5a6fea5b0e7ded6ddbfc2bbc638fbbe'
                   'e61d2ea951779692dfaa515bd13fefe7faa1be2a23ffde147c29aad24cf4f070')

# An AppImage is a binary format, not an archive, so do not attempt to extract it.
noextract=("${_execname_}-${pkgver}-x86_64.AppImage")

# Stripping an AppImage binary will pretty much destroy it, so tell makepkg not to do so.
options=(!strip)

package () {
  install -Dm 775 "${_execname_}-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/${_execname_}"
  install -Dm 644 "${_execname_}.desktop" "${pkgdir}/usr/share/applications/${_execname_}.desktop"
  install -Dm 644 "Icon-512x512.png" "${pkgdir}/usr/share/pixmaps/${_execname_}.png"
}
