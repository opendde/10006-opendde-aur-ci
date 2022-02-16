# Maintainer: Craggles <craggles17@gmail.com>
# Source: https://www.virtualhere.com/client_service
# Installs the binary and a systemd service
pkgname=virtualhere-client
pkgver=1.0.1
pkgrel=1
pkgdesc="VirtualHere USB Client for Linux Desktop"
arch=("i686" "x86_64")
url="https://www.virtualhere.com/usb_server_software"
license=("custom")
depends=("avahi: systemd unit support")
provides=("virtualhere-client")
conflicts=("virtualhere-client")
source=("https://www.virtualhere.com/sites/default/files/usbclient/scripts/virtualhereclient.service"
       "https://www.virtualhere.com/sites/default/files/usbclient/vhclientx86_64")
md5sums=('37d1c9ac1b1d9f4ecb99ea6f5b6af5dc'
	 'a91b625ab6789e4df49db7b647772786'
	)

package() {
    install -Dm755 vhclientx86_64              "${pkgdir}/usr/bin/vhclient"
    install -Dm644 virtualhereclient.service "${pkgdir}/etc/systemd/system/virtualhereclient.service"
}
