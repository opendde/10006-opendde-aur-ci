# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=piavpn-bin
pkgver=2.3.1_05354
_pkgver=2.3.1-05354
pkgrel=4
pkgdesc="Private Internet Access client"
arch=(x86_64)
url="https://privateinternetaccess.com/"
license=('custom')
depends=(net-tools libxkbcommon-x11 libnl xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil)
optdepends=('WIREGUARD-MODULE: to use the wireguard kernel module instead')
makedepends=(libcap)
provides=(piavpn)
conflicts=(pia-launch pia-manager pia-tools private-internet-access-vpn)
install=piavpn-bin.install
source=("https://installers.privateinternetaccess.com/download/pia-linux-${_pkgver}.run")
options=(!strip)
sha256sums=('f04fc91ac37c0097eafd773036b2e4a27d9ad2bb88f3a18a8d720bd8bfdff22b')

prepare() {
	sh pia-linux-${_pkgver}.run --noexec --target "${srcdir}/$pkgname-${_pkgver}"
}

package() {
	cd "$pkgname-$_pkgver"
	mkdir -p $pkgdir/opt/piavpn/bin
	cp -a piafiles/* $pkgdir/opt/piavpn
	cp installfiles/*.sh $pkgdir/opt/piavpn/bin
	chmod +x $pkgdir/opt/piavpn/bin/*.sh
	setcap 'cap_net_bind_service=+ep' $pkgdir/opt/piavpn/bin/pia-unbound

	mkdir $pkgdir/opt/piavpn/var

	mkdir -p $pkgdir/usr/share/pixmaps
	cp installfiles/app.png $pkgdir/usr/share/pixmaps/pia.png
	mkdir -p $pkgdir/usr/share/applications
	cp installfiles/piavpn.desktop $pkgdir/usr/share/applications/piavpn.desktop
	mkdir -p $pkgdir/etc/NetworkManager/conf.d
	echo -e "[keyfile]\nunmanaged-devices=interface-name:wgpia*" > $pkgdir/etc/NetworkManager/conf.d/wgpia.conf

	mkdir -p $pkgdir/usr/local/bin
	ln -s ../../../opt/piavpn/bin/piactl $pkgdir/usr/local/bin/piactl

	mkdir -p $pkgdir/usr/lib/systemd/system
	cp installfiles/piavpn.service $pkgdir/usr/lib/systemd/system/piavpn.service	
	sed -i '/^After/s/syslog.target //' $pkgdir/usr/lib/systemd/system/piavpn.service

	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	cp $pkgdir/opt/piavpn/share/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/

	# limit log to the minimum to avoid excessive flooding
	cat > $pkgdir/opt/piavpn/var/debug.txt << EOF
[rules]
*.debug=false
*.info=false
*.warning=false
EOF
}
