
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell
pkgver=1.2
pkgrel=0
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 'networkmanager' 'xorg-xbacklight')
optdepends=('alsa-utils: for volume controls'
	    'pocketsphinx: for theWave'
	    'festival: for theWave')
makedepends=('qtchooser' 'git' 'clang')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theshell#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qdbuscpp2xml -M -s notificationdbus.h -o org.freedesktop.Notifications.xml
	qmake theShell.pro -r -spec linux-clang
	make
}

package() {
	chmod +x "$pkgname-$pkgver/init_theshell"
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/theshell" "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/init_theshell" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/xsessions"
	cp "$pkgname-$pkgver/theshell.desktop" "$pkgdir/usr/share/xsessions"
}
