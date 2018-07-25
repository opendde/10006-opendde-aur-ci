# Maintainer: Christian Bundy <christianbundy@fraction.io> 
pkgname=patchbay-git
pkgver=7.13.1.r182.g68110fd
pkgrel=1
pkgdesc="An alternative Secure Scuttlebutt client interface that is fully compatible with Patchwork "
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchbay"
license=('MIT')
provides=('patchbay')
conflicts=('patchbay')
depends=('libsodium' 'gtk2' 'gconf' 'python' 'lib32-gcc-libs')
makedepends=('nodejs' 'npm')
options=(!strip)
_srcname=patchbay

source=(
"git+https://github.com/ssbc/${_srcname}.git"
'run.sh'
"${_srcname}.desktop"
)

md5sums=('SKIP'
         '6632351cad7b33d94834e9a37f77f727'
         'f459479fef0987c5fa81a38b04767ffa')

pkgver() {
  cd "${_srcname}"

  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=linux-git&id=e03e86d03543561336930472671ffa3e8b8e8cbd#n34
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

build() {
    cd "${srcdir}/${_srcname}"

    # https://github.com/ssbc/patchbay/issues/211
    npm install --save git://github.com/Happy0/ssb-chess#master
    npm audit fix
   
    npm ci
    npm run rebuild
}

package() {
    cd "${srcdir}/${_srcname}"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_srcname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${_srcname}"
    install -D "${_srcname}.desktop" "${pkgdir}/usr/share/applications/${_srcname}.desktop" 
}
