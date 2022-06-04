# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>

pkgname=juce-bin
pkgver=6.1.6
pkgrel=2
pkgdesc="Cross-platform c++ framework for creating audio applications"
arch=("x86_64")
url="https://github.com/juce-framework/JUCE"
license=('custom')
groups=("pro-audio")
depends=("alsa-lib" "freetype2" "libglvnd" "java-runtime")
provides=("juce")
makedepends=()
checkdepends=()
optdepends=("python")
source=("$url/releases/download/$pkgver/juce-$pkgver-linux.zip" "Projucer.desktop")
md5sums=('f81083063f6bfd10206a7d487d812d5c'
         '1f41df4e862e80ba260038dd8a8ae438')
install=juce-bin.install

package() {
	# Install
	install -dm755 "${pkgdir}/usr/share/"
	cp -R "${srcdir}/JUCE" "${pkgdir}/usr/share/juce/"

	# Install Projucer binary
	install -Dm755 "${srcdir}/JUCE/Projucer" "${pkgdir}/usr/bin/Projucer"
	install -Dm644 "${srcdir}/Projucer.desktop" "${pkgdir}/usr/share/applications/Projucer.desktop"

	#icon for desktop
	install -Dm755 "${srcdir}/JUCE/examples/Assets/juce_icon.png" "${pkgdir}/usr/share/pixmaps/Projucer"

	# License
	install -Dm755 "${srcdir}/JUCE/LICENSE.md" "${pkgdir}/usr/share/licenses/juce-bin/LICENSE.md"
}

