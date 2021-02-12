# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=linux-wifi-hotspot
pkgver=3.6.8
pkgrel=1
pkgdesc="Create virtual wifi hotspot using same wifi card which is connected to an AP + many features (a GUI tool)"
arch=('x86_64')
url="https://github.com/lakinduakash/linux-wifi-hotspot"
license=('BSD')
depends=('hostapd' 'iw' 'gtk3' 'procps-ng' 'dnsmasq' 'iproute2')
optdepends=('haveged: For random MAC generation'
            'wireless_tools: if iw cannot recognize your adapter'
            'bash-completion: for bash completions')
provides=('wihotspot' 'create_ap')
conflicts=('wihotspot' 'create_ap')
backup=('etc/create_ap.conf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7295a656021baa1b2cd04ef105875425fd573b5f8ecb119cd69ccd009d5bed23')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
