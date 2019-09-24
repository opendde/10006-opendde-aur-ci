# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-readonly-beta'
pkgver='1.20.0beta.4'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3' 'libsecret')
optdepends=('gnome-keyring')
source=(
	'https://downloads.mongodb.com/compass/beta/mongodb-compass-readonly-beta-1.20.0-beta.4.x86_64.rpm'
	'launch.sh'
)
sha256sums=(
	'03a5f23dfe07acb342c3e7174132f01018b9e228c98c73e1391def0a30ad8f79'
	'3b624e8b0982ca1418da7b30bca2d52ccee22831de93d9c7b8f87a49791e8e73'
)

package() {
	install -Dm644 "$srcdir/usr/share/mongodb-compass-readonly-beta/resources/app.asar" "$pkgdir/usr/lib/mongodb-compass-readonly-beta/app.asar"
	cp -r "$srcdir/usr/share/mongodb-compass-readonly-beta/resources/app.asar.unpacked/" "$pkgdir/usr/lib/mongodb-compass-readonly-beta/app.asar.unpacked/"
	install -Dm755 "$srcdir/launch.sh" "$pkgdir/usr/bin/mongodb-compass-readonly-beta"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-readonly-beta/LICENSE" "$pkgdir/usr/share/licenses/mongodb-compass-readonly-beta/LICENSE"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-readonly-beta/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/mongodb-compass-readonly-beta/LICENSES.chromium.html"
	install -Dm644 "$srcdir/usr/share/applications/mongodb-compass-readonly-beta.desktop" "$pkgdir/usr/share/applications/mongodb-compass-readonly-beta.desktop"
	install -Dm644 "$srcdir/usr/share/pixmaps/mongodb-compass-readonly-beta.png" "$pkgdir/usr/share/pixmaps/mongodb-compass-readonly-beta.png"
}
