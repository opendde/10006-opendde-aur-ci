pkgname=batman-adv-dkms
pkgver=v2017.1
pkgrel=1
pkgdesc='batman kernel module (dkms package)'
arch=('any')
url='https://www.open-mesh.org/projects/batman-adv'
license=('GPL')
source=(
	"batman-adv::git+https://git.open-mesh.org/batman-adv.git#commit=501142d0da73d5b5c6318784cd0a4c96f13396c9"
	'dkms.conf'
)
sha256sums=('SKIP'
            'af072d643fb0587c8a5af4c7faf0d9a9cb73f3515a3b79853c60d98a30743ab2')
depends=('dkms')

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
	sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
}
