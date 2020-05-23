# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=prometheus-remo-e-exporter
pkgver=0.0.1
pkgrel=1
pkgdesc="Prometheus exporter for Nature Remo E series"
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/remo-e-exporter"
license=('MIT')
makedepends=('cargo')
backup=('etc/conf.d/prometheus-remo-e-exporter')
source=(
  "prometheus-remo-e-exporter.service"
  "prometheus-remo-e-exporter.conf.d"
  "https://github.com/sorah/remo-e-exporter/archive/v${pkgver}.tar.gz"
)

build() {
  cd "remo-e-exporter-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "remo-e-exporter-$pkgver"
  install -Dm0755 target/release/remo_e_exporter "${pkgdir}/usr/bin/prometheus-remo-e-exporter"
  install -Dm0644 "${srcdir}/prometheus-remo-e-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-remo-e-exporter.service"
  install -Dm0640 "${srcdir}/prometheus-remo-e-exporter.conf.d" "${pkgdir}/etc/conf.d/prometheus-remo-e-exporter"
}
sha512sums=('6b5bec9b6367582a8e04b8479d3e11e96f2eaa7bdae6b1d4962e6517f3018c21d6fd65b83b620521fbc9b51e539d27991ea1b9ab3f372d383f4525ab9c085f82'
            '2f8306e46e1a7c16817ff696e6d3e9f46dfcd8ba6f474bd0937daf0c26f3b30353c1c299b48216380080f31e4a6b6915928b9cbf4b44090eac3454ba554ba821'
            '1ff309f255f8317e51b2e1c2c83bc38bba6ef36791206fec977a86961b20bb182dae3d8b3d2b75c3b6d8d307a872115eea11de069729f66f4a2199f6dd6a2851')
