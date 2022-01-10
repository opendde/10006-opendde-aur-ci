# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=ovrclk
_pkgname=akash
pkgname=${_pkgname}-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="A secure, transparent, and peer-to-peer cloud computing network"
arch=('x86_64')
url="https://github.com/${_orgname}/${_pkgname}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
               "https://raw.githubusercontent.com/${_orgname}/${_pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('679830454f9d84d1e6f77dbbc11b9c1acedbaba9a9d889aa83b32a1e82e46a78'
                   'f88a0de961dddc3410a201b6174c54190fdd912310df24ea8292c675981a39cd')

package() {
    install -Dt "${pkgdir}/usr/bin" "${srcdir}/${_pkgname}_${pkgver}_linux_amd64/${_pkgname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
