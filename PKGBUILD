# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=1.2.0
pkgrel=2
pkgdesc="EmulationStation Desktop Edition (ES-DE) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("https://gitlab.com/leonstyhre/emulationstation-de/-/archive/stable-1.2-AUR/emulationstation-de-stable-1.2-AUR.tar.gz")
md5sums=('2ab2f4fcb4875deab286db8a9f66b847')

build() {
        cmake -B emulationstation-de-stable-1.2 -S emulationstation-de-stable-1.2 .
        make -C emulationstation-de-stable-1.2 -j4
}

package() {
        make -C emulationstation-de-stable-1.2 DESTDIR="${pkgdir}" install
}
