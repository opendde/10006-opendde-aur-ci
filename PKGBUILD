# Maintainer: Bao Trinh <qubidt at gmail>

pkgname=prometheus-pve-exporter
pkgver=2.2.2
pkgrel=1
pkgdesc="Proxmox VE exporter for the Prometheus monitoring system"
arch=('any')
url="https://github.com/prometheus-pve/prometheus-pve-exporter"
license=('Apache')
depends=('python'
         'python-prometheus_client'
         'python-proxmoxer'
         'python-yaml'
         'python-requests'
         'python-werkzeug')
backup=("etc/prometheus/pve.yml")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "prometheus-pve-exporter.service"
        "prometheus-pve-exporter.sysusers"
        "prometheus-pve-exporter.tmpfiles"
        "https://raw.githubusercontent.com/prometheus-pve/prometheus-pve-exporter/v${pkgver}/pve.yml"
        )
sha256sums=('f36465d5e6784834f8a9976fc214a022b5a65707463841b6e9f32369118f7a6f'
            '5d1227b6e2fdaa27d8ec4ceafebc95074e2f5a1c27df313c3f00f2f85ef3ee34'
            'd230b99e6ec3663ba8785cc61b8b8983a04596eaf0271bfea0d64189eabbd97f'
            'c9eb4acf94e5a7851e90e721e1baa9b77ae0a276975a2f21e74c569a159358a7'
            '20e03690f199f360eef66cbf11d54b26eac024563a9a3d9cbe777d6b718c2d61')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
