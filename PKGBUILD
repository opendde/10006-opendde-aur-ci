# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-beta'
pkgver='1.20.0beta.9'
pkgrel='1'
pkgdesc='The official GUI for MongoDB (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3' 'libsecret')
optdepends=('gnome-keyring')
source=(
	'https://downloads.mongodb.com/compass/beta/mongodb-compass-beta-1.20.0-beta.9.x86_64.rpm'
	'launch.sh'
)
sha256sums=(
	'2b520b7df6217104f61095ede87221b7925b4f09c415ef63db4d4b4bf0a026ac'
	'd56977ccd11620ed69c5471170640c451ae1635a5d498a1ea41585d36ac9e7d3'
)

package() {
	install -Dm644 "$srcdir/usr/share/mongodb-compass-beta/resources/app.asar" "$pkgdir/usr/lib/mongodb-compass-beta/app.asar"
	cp -r "$srcdir/usr/share/mongodb-compass-beta/resources/app.asar.unpacked/" "$pkgdir/usr/lib/mongodb-compass-beta/app.asar.unpacked/"
	install -Dm755 "$srcdir/launch.sh" "$pkgdir/usr/bin/mongodb-compass-beta"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-beta/LICENSE" "$pkgdir/usr/share/licenses/mongodb-compass-beta/LICENSE"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-beta/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/mongodb-compass-beta/LICENSES.chromium.html"
	install -Dm644 "$srcdir/usr/share/applications/mongodb-compass-beta.desktop" "$pkgdir/usr/share/applications/mongodb-compass-beta.desktop"
	install -Dm644 "$srcdir/usr/share/pixmaps/mongodb-compass-beta.png" "$pkgdir/usr/share/pixmaps/mongodb-compass-beta.png"
}
