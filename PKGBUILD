# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot
pkgver=1.1
pkgrel=4
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('scons')
depends=('glu' 'libxcursor' 'alsa-lib' 'freetype2' 'mesa')
optdepends=()
conflicts=("godot-git")
_arch=''
if test "$CARCH" == x86_64; then
  _arch=('64')
else
  _arch=('32')
fi

source=(
	"https://github.com/okamstudio/godot/archive/${pkgver}-stable.tar.gz"
	godot.desktop
	icon.png
)
md5sums=('87eb2fc3518ce7a27957fada1ba003e9'
         'dca7c5c5682bdc8cc83386034e0d7d07'
         'f756e85756a9cbc06a328414abf74585')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}-stable

    sed -n '/\/* Copyright/,/IN THE SOFTWARE./p' main/main.cpp | sed 's/\/\*//' | sed 's/\*\///' > LICENSE

    scons platform=x11 target=release_debug
}

package() {

    cd "${srcdir}"

    install -Dm644 godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/godot.png
    
    cd "${srcdir}"/${pkgname}-${pkgver}-stable

    install -D -m755 bin/godot.x11.opt.tools.${_arch} "${pkgdir}"/usr/bin/godot
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/godot/LICENSE
}

