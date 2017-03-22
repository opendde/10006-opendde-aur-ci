# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgname='organizr'
_pkgname='Organizr'
pkgver=1.15
pkgrel=1
pkgdesc='HTPC/HomeLab services organizer.'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
install='organizr.install'
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/causefx/Organizr/archive/${pkgver}.tar.gz" "organizr.install")
sha256sums=('9e099f6a085d001d8ab5e2905aa4ebc251ef8c382f9edfc3b4e6f84b6ed9bfe0'
            '75a1a4663fe4d628d88f3ce5f9c9e95761d3f6cfdc753f04d4b9d0e9c57c1735')

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
}
