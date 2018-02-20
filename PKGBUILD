# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Rémi Audebert <rflah0@gmail.com>

pkgname=prometheus-node-exporter
pkgver=0.15.2
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics"
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/prometheus/node_exporter/archive/v${pkgver}.tar.gz"
        "prometheus-node-exporter.service")
sha256sums=('940b850376f94580e88b5e99926d92899975d5792d05709cbd9c48dab0a848ad'
            '90a2e398262d0352e5a51b5f1bbe1098856429d8201378a925987391fc672328')

prepare() {
  cd "${srcdir}/node_exporter-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/prometheus"
  ln -snf "${srcdir}/node_exporter-${pkgver}" \
    "${GOPATH}/src/github.com/prometheus/node_exporter"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/prometheus/node_exporter"

  make build
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/prometheus/node_exporter"

  make test test-e2e -o build
}

package() {
  cd "${srcdir}/node_exporter-${pkgver}"

  install -Dm755 "node_exporter" "${pkgdir}/usr/bin/prometheus_node_exporter"
  install -Dm755 "${srcdir}/prometheus-node-exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-node-exporter.service"
}
