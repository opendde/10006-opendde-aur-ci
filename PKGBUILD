# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=sparrow-wifi-git
pkgver=r170.ad95f2e
pkgrel=3
pkgdesc="Next-Gen GUI-based WiFi and Bluetooth Analyzer for Linux"
arch=('any')
url="https://github.com/ghostop14/sparrow-wifi"
license=('GPL3')
depends=('aircrack-ng'
         'iw'
         'tk'
         'python-matplotlib'
         'python-qscintilla-qt5'
         'python-pyqt5-sip'
         'qt5-declarative'
         'python-gps3'
         'python-manuf'
         'python-dateutil'
         'python-numpy'
         'python-pyqt5-chart'
         'polkit'
         'wireless_tools')
makedepends=('git')
optdepends=('gpsd: GPS support'
            'bluez-utils-compat: Blueooth-support'
            'ubertooth-git: Ubertooth support'
            'python-dronekit: Drone communication support'
            'net-tools: for rpi.monitor_3dr script'
            'python-elasticsearch'
            'python-pytz')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("opt/${pkgname%-git}/sparrowwifiagent.cfg")
install="${pkgname%-git}.install"
source=('git+https://github.com/ghostop14/sparrow-wifi.git'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh"
        "org.freedesktop.${pkgname%-git}.policy")
sha256sums=('SKIP'
            'ec12b01c211e0860c478db732d7328358c0aa8be195168d569902ce159c44d29'
            'a481414dc5a34589ca116ae29e4ba062cf773f398356fc73c60501340213525b'
            '2d141b0f79939feecb21ff0d06575a2f4fa58cf8faabba45951aec6ad79c021e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's|service gpsd status|systemctl status gpsd|g' scripts/*.sh
	sed -i 's|service gpsd stop|systemctl stop gpsd|g' scripts/*.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 sparrowwifiagent.cfg.sample \
		"$pkgdir/opt/${pkgname%-git}/sparrowwifiagent.cfg"
	cp -r *.py scripts "$pkgdir/opt/${pkgname%-git}"

	python -O -m compileall "$pkgdir/opt/${pkgname%-git}"

	install -Dm644 docs/* README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
	install -Dm644 wifi_icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"

	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
		"${pkgdir}/usr/share/applications"
	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/org.freedesktop.${pkgname%-git}.policy" -t \
		"$pkgdir/usr/share/polkit-1/actions"

	ln -s /opt/sparrow-wifi/scripts/rpi.sparrowagentstart.sh \
		"$pkgdir/usr/bin/rpi.sparrowagentstart"
	ln -s /opt/sparrow-wifi/scripts/rpi.sparrowagentstop.sh \
		"$pkgdir/usr/bin/rpi.sparrowagentstop"
	ln -s /opt/sparrow-wifi/scripts/rpi.monitor_3dr.sh \
		"$pkgdir/usr/bin/rpi.monitor_3dr"
}
