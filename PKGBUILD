# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=1.2.3
pkgrel=1
pkgdesc="EmulationStation Desktop Edition (ES-DE) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-1.2-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-1.2-AUR/emulationstation-de-stable-1.2-AUR.tar.gz")
md5sums=('fe6056ed98d54dfca0f21e6a548565aa')

build() {
        cmake -B emulationstation-de-stable-1.2-AUR -S emulationstation-de-stable-1.2-AUR
        make -C emulationstation-de-stable-1.2-AUR -j4
}

package() {
        make -C emulationstation-de-stable-1.2-AUR DESTDIR="${pkgdir}" install
}
