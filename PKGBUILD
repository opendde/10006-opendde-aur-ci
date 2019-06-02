# Maintainer: osch <oliver@luced.de>
pkgname=surge-synthesizer-bin
pkgver=1.6.0
debver=1.6.0
pkgrel=1
pkgdesc="Surge Synthesizer plugin"
arch=('x86_64')
url="https://surge-synthesizer.github.io"
license=('GPL3')
groups=('vst-plugins')
depends=('cairo'  'fontconfig'          'freetype2'
         'libx11' 'xcb-util-cursor'     'xcb-util'
         'libxcb' 'xcb-util-renderutil' 'xcb-util-image')
provides=("surge-synthesizer")
conflicts=('surge-synthesizer')
options=('!strip' '!libtool' '!emptydirs')
source=("https://github.com/surge-synthesizer/releases/releases/download/$debver/Surge-linux-x64-$debver.deb")

package() {
	ar x "Surge-linux-x64-$debver.deb"
	rm -f data.tar
	unxz data.tar.xz
	tar xf data.tar
	cp -r usr "$pkgdir/"
}
md5sums=('096ad7019b485fb878dd9917e0c25660')
