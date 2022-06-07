_pkgbase=bmi160-aya-neo
pkgname=${_pkgbase}-dkms-git
pkgver=1.0.0
pkgrel=1
pkgdesc='BMI160 DKMS driver for devices with 10EC5280 ACPI ID'
arch=(any)
url=https://github.com/pastaq/bmi160-aya-neo
license=(GPL3)
depends=()
makedepends=(dkms git wget linux-headers)
source=(git+"${url}".git)
sha256sums=('SKIP')

package() {
	cd "${srcdir}"/"${_pkgbase}"
  	local install_dir="${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
	
  	install -Dm644 bmi160_ayaneo.patch "${install_dir}/bmi160_ayaneo.patch"
	install -Dm644 bmi160_i2c-mods.conf "${install_dir}/bmi160_i2c-mods.conf"
  	install -Dm644 dkms.conf "${install_dir}/dkms.conf"
	install -Dm755 dkms-patchmodule.sh  "${install_dir}/dkms-patchmodule.sh"
	install -Dm755 dkms.post_install "${install_dir}/dkms.post_install"
	install -Dm755 dkms.post_remove "${install_dir}/dkms.post_remove"
  	install -Dm644 Makefile "${install_dir}/Makefile"
		
	# Set name and version
  	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      	    -e "s/@PKGVER@/${pkgver}/" \
            -i "${install_dir}"/dkms.conf
}
