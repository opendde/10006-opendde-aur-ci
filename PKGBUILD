# Maintainer: Peter K. Moss <peter@moss.dk>
pkgname=qmarkdown-git
pkgver=r65.68db5e4
pkgrel=1
pkgdesc="qMarkdown - minimal markdown viewer"
arch=("x86_64")
url="https://github.com/Peterkmoss/qmarkdown"
license=('GPL')
depends=('qt5-base' 'qt5-webengine' 'qt5-webchannel')
optdepends=('ttf-roboto')
makedepends=('gcc>=9' 'git')
provides=('qmarkdown')
conflicts=('qmarkdown')
source=('git+https://github.com/Peterkmoss/qmarkdown')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
