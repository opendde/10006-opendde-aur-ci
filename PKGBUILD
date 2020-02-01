# Maintainer: Michele Bovo <mbovo@gmx.com>

pkgname=dosbox-x
pkgver=0.82.26
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg)
makedepends=(glu)
optdepends=()
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
		dosbox-x.png
		dosbox-x.desktop)
sha256sums=('c579533dd7b38f5c44a76b2f6ccc40b835a90f688213081b63cc255d5dac50b5'
			'caa164f3d17d414733882d29098cb9cd63faddbdd5580a0c30f1173a63c42475'
			'cf6f6054f191d275d72a67fc664226b56444777bf6df464e2a9977339ebcf6f0')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/dosbox-x.png" \
	"${pkgdir}/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "${srcdir}/dosbox-x.desktop" \
	"${pkgdir}/usr/share/applications/dosbox-x.desktop"
}
