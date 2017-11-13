# Maintainer: Felix Morgner <felix.morgner@gmail.com>

_pkgname=cyber
pkgname=${_pkgname}-dkms
pkgver=42.1729.1812
pkgrel=3
pkgdesc="CYBER for your system (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/fmorgner/dev-cyber"
license=('GPL2')
depends=('dkms')
source=("https://github.com/fmorgner/dev-cyber/archive/v${pkgver}.tar.gz"
        "dkms.conf"
        "10-cyber.conf")
sha256sums=('ffb268642b5823fc4f15a3d91c575c03f66c13d286d80dd09c2d94e9011b1e34'
            'd976032e9f79a5cc679872b48e1c38124411891b6ce01527bfe24ff8f3df3a16'
            '99100ac04db2147ef246377b1ea4fc0c17106d37286e5d61cc02201301a85bbb')

package() {
  cd "${srcdir}"

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -Dm644 10-cyber.conf "${pkgdir}/etc/modules-load.d/10-cyber.conf"

  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}/dkms.conf"

  cd "dev-${_pkgname}-${pkgver}"

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
