# Maintainer: Simon Kronberg <Simon.Kronberg@gmail.com>
pkgname=waterfox-current-bin
pkgver=68.0b1
pkgrel=1
pkgdesc="64-bit Firefox fork; no telemetry; supports XUL & XPCOM (incl. unsigned) add-ons."
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=('alsa-lib' 'pulseaudio')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('waterfox-current.desktop' 'https://storage-waterfox.netdna-ssl.com/Waterfox/beta/Linux/waterfox-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}

	# Move the .desktop file and the icon.
	install -m644 "${srcdir}"/waterfox-current.desktop "${pkgdir}"/usr/share/applications/
	install -m644 "${srcdir}"/waterfox/browser/chrome/icons/default/default128.png "${pkgdir}"/usr/share/pixmaps/waterfox-current-icon.png

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-current

	# Symlink the binary to /usr/bin/.
	ln -s /opt/waterfox-current/waterfox "${pkgdir}"/usr/bin/waterfox-current
}

sha256sums=('5f8ba20330972933914bcfc52c59d7d61db5ada8f417d1c2a31497c8c8f12bc4'
            '71e77aea048515a63f218d84559f3f49ca1e79a5729ef3b81ae0c622f95baccd')
