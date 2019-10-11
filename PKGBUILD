# Contributor: Kim Scarborough <sluggo@unknown.nu>

pkgname=treeline
pkgver=3.1.2
pkgrel=1
pkgdesc="Outliner and PIM which stores information in a tree structure"
arch=('any')
url="http://treeline.bellz.org/";
license=('GPL2')
depends=('python-lxml' 'python-pyqt5')
optdepends=('aspell' 'ispell' 'hunspell')
conflicts=('treeline-unstable')
source=("https://github.com/doug-101/TreeLine/releases/download/v${pkgver}/treeline-${pkgver}.tar.gz"
	"treeline.xml")
sha256sums=('bfe4055562c20a9d71a244ca9e188c00010760d014ef8ab718e96036948df689'
            '2b23717127a37888499bddf62042eddb800d58b10ec88f3f54a538c8e24b19d6')

package() {
  install -Dm644 treeline.xml      "${pkgdir}/usr/share/mime/packages/x-treeline.xml"
  cd "${srcdir}/TreeLine"
  python install.py -p /usr -b  "${pkgdir}"
  install -Dm644 treeline.desktop  "${pkgdir}/usr/share/applications/treeline.desktop"
}
