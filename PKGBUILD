# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname="nzbhydra2"
pkgver=2.9.0
pkgrel=1
pkgdesc="Search aggregator for newznab and torznab indexers"
arch=('any')
url="https://github.com/theotherp/nzbhydra2"
license=('Apache')
depends=('python2' 'java-runtime-headless>=8')
optdepends=('jackett: torrent indexer proxy')
source=("https://github.com/theotherp/nzbhydra2/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.zip"
        'nzbhydra2.service'
        'nzbhydra2.tmpfiles'
        'nzbhydra2.sysusers')

sha256sums=('bc822d57632fe839af69033df095fc5ebac34809b0449246abab418412f12df8'
            '8c864fa865c92a6e0182f4dd3d4032ad85f09d021444cca217efafecbeff33c3'
            '464bffa0e7bf99ccd7bbcdb787b25b53b7692f86f081a4fe347b92f88c56fb09'
            '8f91eb4f98f7f5c11590b29b1394dfa7ca62ad115feeac4f402c9ac094fb925a')

package() {
    install -d -m 755 "${pkgdir}/usr/lib/nzbhydra2"
    cp -dpr --no-preserve=ownership "${srcdir}/lib" "${srcdir}/readme.md" "${pkgdir}/usr/lib/nzbhydra2"
    install -D -m 755 "${srcdir}/nzbhydra2wrapper.py" "${pkgdir}/usr/lib/nzbhydra2/nzbhydra2wrapper.py"
    install -D -m 755 "${srcdir}/nzbhydra2" "${pkgdir}/usr/lib/nzbhydra2"

    install -D -m 644 "${srcdir}/nzbhydra2.service" "${pkgdir}/usr/lib/systemd/system/nzbhydra2.service"
    install -D -m 644 "${srcdir}/nzbhydra2.sysusers" "${pkgdir}/usr/lib/sysusers.d/nzbhydra2.conf"
    install -D -m 644 "${srcdir}/nzbhydra2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/nzbhydra2.conf"
}
