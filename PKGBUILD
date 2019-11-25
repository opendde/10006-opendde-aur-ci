# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rebuild-detector
pkgver=3.0.0
pkgrel=1
pkgdesc='Detects which packages need to be rebuilt'
arch=('any')
url="https://github.com/maximbaz/${pkgname}"
license=('MIT')
depends=('parallel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}.tar.gz.sig")
sha256sums=('ca65a3158ee9bda7706dcb87be831b26bea04f923fb14b26e5b0da06a3a91ea1'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" checkrebuild
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks" "${pkgname}.hook"
}

# vim:set ts=4 sw=4 et:
