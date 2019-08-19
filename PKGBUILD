# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='snmp_exporter'
pkgver='0.15.0'
pkgrel='2'
pkgdesc='This is an exporter that exposes information gathered from SNMP for use by the Prometheus monitoring system'
arch=('x86_64' 'i686')
url="https://github.com/prometheus/${pkgname}"
license=('Apache')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('b77a571f30ccb90176b51c2adfa3faba6b4dc5ea628dd494af4b1726598c7f46'
            '0f1b59f5b416b37665ddb5ab3cf40a4fc4bf0c4622f68da018793194dc2f1206'
            '2747fabb4e56b808361eb7dd7acf9729ab8973d1ebe2f857dd56f6c71f71e45f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/prometheus"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/prometheus/${pkgname}"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/prometheus/${pkgname}"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 -o210 -g210 "snmp.yml" "${pkgdir}/etc/prometheus/snmp.yml"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
