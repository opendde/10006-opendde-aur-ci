# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-pcb-diff
pkgver=2.4.2
pkgrel=2
epoch=
pkgdesc="Tool to generate a PDF file showing the changes between two KiCad PCB/SCH files. Also a git plug-in."
arch=('any')
url="https://github.com/INTI-CMNB/KiDiff"
license=('GPL-2.0')
groups=()
depends=('python' 'kicad' 'python-wxpython' 'imagemagick' 'librsvg' 'poppler' 'xdg-utils')
makedepends=("python-setuptools")
checkdepends=()
optdepends=("kiauto-git: KiCad automation scripts.")
provides=('kidiff' 'kicad-diff')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("KiDiff-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('32ef7ac5083ae9e59c71b304840e059a137b363a40afe3c2e697d5d710c68744')
#validpgpkeys=()

package() {
    cd "${srcdir}/KiDiff-${pkgver}"
     python setup.py install --no-compile --root="$pkgdir"
     install -dm0755 "${pkgdir}/usr/bin"
#    make prefix="${pkgdir}"/usr install
}
