# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=txr
pkgver=238
pkgrel=1
pkgdesc="A data munging language."
arch=('i686' 'x86_64')
url="http://nongnu.org/txr/"
license=('BSD')
depends=('libffi')
makedepends=()
source=(
	"http://www.kylheku.com/cgit/txr/snapshot/txr-${pkgver}.tar.bz2"
	"ftdetect.vim"
)
sha256sums=('3c2a4f5079243e1ae50967dbb136996366f5a0151d0e7fa7520a816226cb4bfe'
            'bc0bd1d70610a7bc08245c3641f19e5a602b82932b46c8897c23599d0a55271a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	# Tests have to run sequentially.
	make -j1 tests.clean tests
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	# txr installs licenses to /usr/share/txr. Add symlinks from Arch's
	# usual license directory.
	mkdir -p "$pkgdir/usr/share/licenses/txr"
	ln -s -t "$pkgdir/usr/share/licenses/txr" ../../txr/LICENSE ../../txr/METALICENSE
	# install vim syntax files
	install -m644 -D -t "$pkgdir/usr/share/vim/vimfiles/syntax" txr.vim tl.vim
	install -m644 -D ../ftdetect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/txr.vim"
}
