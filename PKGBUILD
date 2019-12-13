# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
projectname=pterodactyl
pkgname=pterodactyl-panel
pkgname1=panel
githuborg=pterodactyl
pkgdesc="Open-source game server management panel"
pkgver=0.7.15
pkgpath="github.com/${githuborg}/${pkgname1}"
pkgrel=3
arch=('any')
url="https://${pkgpath}"
license=()
makedepends=()
#https://pterodactyl.io/community/installation-guides/daemon/debian10.html#install-requirements
depends=(mariadb mariadb-clients php php-gd php-fpm redis composer)
source=("${url}/releases/download/v${pkgver}/${pkgname1}.tar.gz")
sha256sums=('0beb6e5c5056255fc34eb199127a24d412bd66d3a6622b311b763adb14629c4b')

build() {

echo -e "# Pterodactyl Queue Worker File
# ----------------------------------
[Unit]
Description=Pterodactyl Queue Worker
After=redis-server.service

[Service]
# On some systems the user and group might be different.
# Some systems use `apache` or `nginx` as the user and group.
#User=www-data
#Group=www-data
Restart=always
ExecStart=/usr/bin/php /var/www/pterodactyl/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3

[Install]
WantedBy=multi-user.target" > ${srcdir}/pteroq.service
}

package() {
	#https://pterodactyl.io/daemon/installing.html#installing-daemon-software
	mkdir -p ${pkgdir}/var/www/${pkgname}
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	cd ${pkgdir}/var/www/${pkgname}
	tar --strip-components=1 -xzvf ${srcdir}/panel.tar.gz
	chmod -R 755 storage/* bootstrap/cache/
	install -Dm644 ${srcdir}/pteroq.service ${pkgdir}/usr/lib/systemd/system/
}
