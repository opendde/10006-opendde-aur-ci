# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="roundcubemail-plugin-carddav"
pkgver=4.0.1
pkgrel=2
pkgdesc="CardDAV plugin for RoundCube Webmailer"
url="https://github.com/blind-coder/rcmcarddav"
license=("GPL2")
arch=("any")
conflicts=("roundcube-rcmcarddav" "roundcube-rcmcarddav-git" "roundcubemail-plugin-carddav-git")
depends=("roundcubemail")
makedepends=("composer")
source=("$url/releases/download/v$pkgver/carddav-v$pkgver.tgz")
md5sums=("e1b801837689eb18a1703265ee07ac91")
backup=("etc/webapps/roundcubemail/plugins/carddav/config.inc.php")

package() {
 cd "carddav"
 sed -i 's|"dealerdirect/phpcodesniffer-composer-installer": "^0.6.0"|"dealerdirect/phpcodesniffer-composer-installer": "^0.7.0"|' "composer.json"
 composer install --no-interaction --no-dev
 install -d "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 cp -r * "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
 install -D -o root -g http -m 640 "config.inc.php.dist" "$pkgdir/etc/webapps/roundcubemail/plugins/carddav/config.inc.php"
 ln -s "/etc/webapps/roundcubemail/plugins/carddav/config.inc.php" "$pkgdir/usr/share/webapps/roundcubemail/plugins/carddav/config.inc.php"
}
