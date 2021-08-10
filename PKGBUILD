# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-bin
pkgver=3.11.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://stackexchange.github.io/dnscontrol/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}::https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol-Linux"
        "LICENSE::https://raw.githubusercontent.com/StackExchange/dnscontrol/v${pkgver}/LICENSE")
sha512sums=('f169de94e41167e111bdb4e930cf245a92085649b8068bad09a66d62ce09fc07efe130fba65e51cba75deb65327193f8b7f36f7398ba7a9b1c1a70726d3c6aa0'
            'd268dfcfce2ffa0f1abef5334207bdd4c142a0c069d7a5a5d4863d6f2ab57fde740fe6e6270225479de564bfde78891a131d879c3d2ab29708c63f786c0e009e')

package() {
	# add bin
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	# add license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
