pkgname=screego-server-bin
_pkgname=server
pkgver=1.7.4
pkgrel=1
pkgdesc='screen sharing for developers'
arch=('x86_64' 'arm64')
url="https://github.com/screego/$_pkgname"
license=('GPL3')
provides=("screego-server")
conflict=("screego-server")
makedepends=()
optdepends=('nginx: to allow reverse proxy connections')
source_x86_64=("$pkgname-${pkgver}_amd64.tar.gz::$url/releases/download/v$pkgver/screego_${pkgver}_linux_amd64.tar.gz")
source_arm64=("$pkgname-${pkgver}_arm64.tar.gz::$url/releases/download/v$pkgver/screego_${pkgver}_linux_arm64.tar.gz")
source=(
	"screego-server.service"
	"tmpfiles.conf"
	"sysusers.conf"
	)
sha256sums=('12d8f8488d36a6d70b0366deda63ba959d3692d6fa078dfedd0aeedd4a042b06'
            '1d4494d5328700b304b0837dafc7a5772b8abe3435a0a24337a89f25ad5acd1b'
            '5804e54e4af5704fd5066c45313d7635798bd4389cd8312ee965c911d9d75e85')
sha256sums_x86_64=('6ca99a7f51ed15fe3f21b779adcdb8448c5c8afbab409f1a1272bb79d19353f8')
sha256sums_arm64=('aa2bd0c8a1dc4c79c03c4f1a21defd6fde54a2b010cbebc93a9cb39dbc3937b6')

package() {
	mkdir -p "${pkgdir}/var/lib/screego-server/logs" \
		 "${pkgdir}/etc/screego/"
	install -m755 "${srcdir}/screego" \
		       "${pkgdir}/var/lib/screego-server/screego-server"
	install -m755 "${srcdir}/screego.config.example" \
		      "${pkgdir}/etc/screego/server.config"
	install -Dm644 "screego-server.service" \
		       "$pkgdir/usr/lib/systemd/system/screego-server.service"
	install -Dm644 "sysusers.conf" \
		       "$pkgdir/usr/lib/sysusers.d/screego-server.conf"
	install -Dm644 "tmpfiles.conf" \
		       "$pkgdir/usr/lib/tmpfiles.d/screego-server.conf"
}
