# Maintainer: Bernd Amend <bernd.amend(at)gmail(dot)com>
# Contributor: Alex Avance <aravance(at)gmail(dot)com>
# Contributor: Shen-Ta Hsieh <ibmibmibm(at)gmail(dot)com>

_pkgname=r8125
pkgname=${_pkgname}-dkms
pkgver=9.005.01
pkgrel=1
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software"
pkgdesc="Kernel module for RTL8125"
license=('GPL2')
arch=('any')
depends=('dkms')
conflicts=("${_pkgname}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=("https://github.com/aravance/${_pkgname}/archive/${pkgver}.tar.gz" 'dkms.conf')
sha256sums=('653696e5cf6e4686b4b62ac25b21d77c82f975a3344ef88d77dbb29e898c506a'
            'ad4c67e0c74661d19b74872f98254184d4b04e32e4c57b338a84fbcefa4c721f')

package() {
  dir_name="${_pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/src/${dir_name}/
  install -Dm644 dkms.conf "${dir_name}"/src/* "${pkgdir}/usr/src/${dir_name}/"

  sed -e "s/@_PKGNAME@/${_pkgname}/g" \
      -e "s/@PKGVER@/${pkgver}/g" \
      -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
