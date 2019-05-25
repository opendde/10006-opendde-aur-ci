# Maintainer: Benjamin Auder <benjamin.a@mailoo.org>
pkgname=fuse-zip
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="FUSE file system to navigate, extract, create and modify ZIP and ZIP64 archives"
arch=('i686' 'x86_64' 'armv7h')
url="https://bitbucket.org/agalanin/fuse-zip"
license=('GPL')
groups=()
depends=('fuse' 'libzip')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://bitbucket.org/agalanin/fuse-zip/downloads/$pkgname-$pkgver.tar.gz" "Makefile.patch")
md5sums=('bbe72713ac598610dc51f33039fb14fb'
         '9b43b740eb8ba94d3cddb724ba19637e')
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 -i "$srcdir/Makefile.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make release
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	make DESTDIR="$pkgdir" install
}
