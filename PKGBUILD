# Maintainer: Roberto Valentini <valantin89[at]gmail[dot]com>

pkgname=ipmiview
pkgver=2.10.2
_pkgname=IPMIView
_pkgrev=20150203
_pkgver=${_pkgver}_${_pkgrev}
pkgrel=1
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64' 'i686')
if [ "${CARCH}" = "x86_64" ]; then
    _pkgarch=x64
else
    _pkgarch=x32
fi
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMIView/Linux/${_pkgname}_V${pkgver}_bundleJRE_Linux_${_pkgarch}_${_pkgrev}.tar.gz"
        "ipmiview.desktop")
sha256sums=('577ccc48e7d70325ef2f922a0784acdcf72fe6bded8e195a47efa03da6db4b74'
            '41d5fa089912ee10d476a0f6aa3c12765861c1a71cf4f811efaf2e47c4ce9351')

package() {
    cd ${srcdir}/${_pkgname}_V${pkgver}_bundleJRE_Linux_${_pkgarch}_${_pkgrev}

    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/applications

    cp -rf . ${pkgdir}/opt/${pkgname}

    touch ${pkgdir}/opt/${pkgname}/timeout.properties
    touch ${pkgdir}/opt/${pkgname}/account.properties
    touch ${pkgdir}/opt/${pkgname}/email.properties
    touch ${pkgdir}/opt/${pkgname}/IPMIView.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/timeout.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/account.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/email.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/IPMIView.properties

    ln -s /opt/${pkgname}/IPMIView20 ${pkgdir}/usr/bin/${pkgname}
    install -m 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
