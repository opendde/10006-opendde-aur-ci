# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=arena-tracker
pkgver=4.2
pkgrel=1
pkgdesc="Tracks your Hearthstone Arena matches and cards"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
depends=('qt5-base' 'python-pyautogui' 'xcb-util-renderutil' 'libpng12')
provides=(arena-tracker)
conflicts=('arena-tracker-git')
source=("https://github.com/supertriodo/Arena-Tracker/releases/download/v$pkgver/Arena.Tracker.v$pkgver.Linux.zip"
	"ArenaTracker.ico"
	"arena-tracker.desktop")

package() {
	install -dm755 $pkgdir/opt/$pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/share/icons/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/"Arena Tracker v$pkgver Linux"/ArenaTracker $pkgdir/opt/$pkgname/$pkgname
	install -m755 $srcdir/ArenaTracker.ico $pkgdir/usr/share/icons/$pkgname.ico
	install -m755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

md5sums=('423f95ad8aee19f51e3647a14432f08a'
	'926afbd5024076726f89aa5eb8937a31'
	'c81a05fdc3b96092fb363f841267e21f')
