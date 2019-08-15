# Maintainer: Simon Kronberg <Simon.Kronberg@gmail.com>
pkgname=waterfox-alpha-bin
pkgver=68.0a1
pkgrel=4
pkgdesc="64-bit Firefox fork; no telemetry; supports XUL & XPCOM (incl. unsigned) add-ons."
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=('alsa-lib' 'pulseaudio')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('waterfox-alpha.desktop' 'https://storage-waterfox.netdna-ssl.com/Waterfox/aurora/Linux/waterfox-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}

	# Move the .desktop file and the icon.
	install -m644 "${srcdir}"/waterfox-alpha.desktop "${pkgdir}"/usr/share/applications/
	install -m644 "${srcdir}"/waterfox/browser/chrome/icons/default/default128.png "${pkgdir}"/usr/share/pixmaps/waterfox-alpha-icon.png

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-alpha

	# Symlink the binary to /usr/bin/.
	ln -s /opt/waterfox-alpha/waterfox "${pkgdir}"/usr/bin/waterfox-alpha
}

sha256sums=('ef13a31b848b3f3ad153bff3c3a97c1ec1576c57b705d7c8fbc84fb3ef87a129'
            '6ed7b01d35e8ffa7cc6a238afce7f654aae64683ff47aa77d40f78acd7151c45')
