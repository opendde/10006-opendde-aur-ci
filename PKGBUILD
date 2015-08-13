# Maintainer:  Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>
# Previous maintainer:  agnotek <agnostic.sn [at]gmail.com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=telegram-desktop-bin
pkgver=0.8.48
pkgrel=1
pkgdesc="Official desktop version of Telegram messaging app."
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL3')
depends=('libx11' 'libgcrypt' 'libasyncns' 'libsndfile' 'libsystemd' 'libdbus' 'openal' 'libogg' 'opus' 'opusfile' 'portaudio' 'openssl' 'zlib' 'libexif' 'xz')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
replaces=('telegram-bin')
install="$pkgname.install"

# Sources
source=("$pkgname.sh" "$pkgname.desktop" "$pkgname.png")
source_i686=('https://updates.tdesktop.com/tlinux32/tsetup32.'$pkgver'.tar.xz')
source_x86_64=('https://updates.tdesktop.com/tlinux/tsetup.'$pkgver'.tar.xz')
# Checksums
sha256sums=('0f2a6e4c2b9b4ff5f4ddb628728be4cc5a419f79695c0151321a5f234099ee59'
            'e3e10fe8620bd4ed8fda41743ad844739757286eeecea5249cf1fcf21a8431bd'
            '4226167b476a75e844ddf0d429068e7e901bbde516810a7d4ca90f8405c01eef')
sha256sums_i686=('4f1568b0550668f34192d628f1e61068df9b7f6de636cce86abeeed367c9cbc1')
sha256sums_x86_64=('58434177cc14998a4cd90ad255d6853debd02971c189471907cca0e0cc5facb1')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/opt/telegram/"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/opt/telegram/"
	install -Dm755 "$srcdir/Telegram/Updater" "$pkgdir/opt/telegram/"

	# Shell wrapper
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/telegram"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"
}
