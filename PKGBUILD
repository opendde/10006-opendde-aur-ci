# Maintainer: Gavin Yancey <gyancey@hmc.edu>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees
pkgver=0.6.3
pkgrel=1
pkgdesc="Best-Effort Extent-Same, a btrfs deduplicator daemon"
arch=('x86_64')
url="https://github.com/Zygo/bees"
license=('GPL3')
depends=()
makedepends=('git' 'make' 'gcc' 'markdown' 'btrfs-progs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Zygo/bees/archive/v${pkgver}.tar.gz")
sha256sums=('874969b9198867652364c3149f214f39bdfe0efed67d279c6b77b37765661e54')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make BEES_VERSION="${pkgver}-${pkgrel}"
	make scripts BEES_VERSION="${pkgver}-${pkgrel}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make install DESTDIR="${pkgdir}" BEES_VERSION="${pkgver}-${pkgrel}"

	mkdir -p "${pkgdir}/usr/bin/"

	if [ -f "${pkgdir}/usr/sbin/beesd" ]; then
		mv -v "${pkgdir}/usr/sbin/beesd" "${pkgdir}/usr/bin/beesd"
	fi

	if egrep "${srcdir}|${pkgdir}" "${pkgdir}/usr/bin/beesd"; then
		exit 1
	fi

	find ${pkgdir} -empty -delete -print
}
