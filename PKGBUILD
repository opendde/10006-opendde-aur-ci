# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=sensu-go-agent
pkgver=5.17.2
_pkgbuild=9349
_pkgver="${pkgver}-${_pkgbuild}"
pkgrel=1
pkgdesc="Sensu Go Agent"
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
provides=("${pkgname/-go-/-}")
conflicts=("${pkgname/-go-/-}")
source=("${pkgname}-${_pkgver}_amd64.deb::https://packagecloud.io/sensu/stable/packages/debian/buster/${pkgname}_${_pkgver}_amd64.deb/download.deb"
        "sensu.sysusers"
        "sensu.tmpfiles")
sha1sums=('8cc5dc9d1d52f1f13b30f23cc9c869813b25780e'
          '054c2cfb7b2c4e6900fe79620b40fd060dbc0d8a'
          '9cca06fcbb23d5618382cc14e4ab4cc73c1f91fa')

prepare() {
    cd "${srcdir}"
    tar xaf data.tar.gz
    # change /usr/sbin to /usr/bin
    sed -i 's/\/usr\/sbin\//\/usr\/bin\//g' "${srcdir}/usr/share/${pkgname}-${pkgver}/${pkgname/-go-/-}.service"
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/usr/sbin/${pkgname/-go-/-}" "${pkgdir}/usr/bin/${pkgname/-go-/-}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/README.txt"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/${pkgname/sensu-go-/}.yml.example" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/${pkgname/sensu-go-/}.yml.example"
    install -Dm644 "${srcdir}/usr/share/${pkgname}-${pkgver}/${pkgname/-go-/-}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-go-/-}.service"
    install -Dm644 "sensu.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "sensu.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

