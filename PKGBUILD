# Maintainer:     VOID_133 <zhangjianqiu13(at)gmail.com>
# Maintainer:     Ken_Ookami_Horo <horo(at)yoitsu.moe>
# Contributor:    Sherlock Holo <sherlockya(at)gmail.com>
# Contributor:    FiveYellowMice <hkz85825915(at)gmail.com>
# Contributor:    KireinaHoro <xubin990510(at)gmail.com>

pkgname=dev-horo-git
_pkgname=dev.horo
_HOROK="horok.conf"
pkgver=0.0.1
pkgrel=7
pkgdesc="Horo in your Linux"
arch=('i686' 'x86_64')
url="https://github.com/VOID001/dev.horo"
license=("GPL3")
depends=('dkms')
makedepends=('git' 'go')
source=("git+https://github.com/VOID001/${_pkgname}.git")

_MODULE_NAME="horok.ko"
_HOROPROXY="horoproxy"

build() {
        cd "$srcdir/$_pkgname/$_HOROPROXY"
        go build
}

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 ${_HOROPROXY}/${_HOROPROXY} "$pkgdir/usr/bin/${_HOROPROXY}"

        sed -e "10s/^/#/g" -i "${srcdir}/${_pkgname}/Makefile"

        mkdir -p                      "${pkgdir}/usr/src/${pkgname}-${pkgver}"
        cp -r ${srcdir}/${_pkgname}/* "${pkgdir}/usr/src/${pkgname}-${pkgver}/"

        sed -e "s/@PKGNAME@/${pkgname}/" \
            -e "s/@PKGVER@/${pkgver}/" \
            -i "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}


md5sums=('SKIP')
