# Maintainer: Roman Rader <antigluk@gmail.com>
pkgname=vagga-bin

vagga_source_version() {
	curl -s http://files.zerogw.com/vagga/latest-testing.html | sed -e 's/<[^>]*>//g' -e 's/vagga-//g' -e 's/.tar.xz//g'
}
pkgver() {
	vagga_source_version | tr '-' '_'
}
pkgver=0.2.5_146_gbae3de7
pkgrel=2
pkgdesc="Vagga is a containerisation tool without daemons"
arch=('i686' 'x86_64')
url="http://vagga.readthedocs.org"
license=('MIT')
depends=('shadow' 'glibc-static')
makedepends=()
checkdepends=()
optdepends=('linux-user-ns-enabled: kernel with CONFIG_USER_NS enabled')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=vagga.install
changelog=
source=()
noextract=()

prepare() {
	[ -d "$pkgname" ] && rm -r "$pkgname"
	mkdir "$pkgname"
	curl -O vagga.tar.xz "http://files.zerogw.com/vagga/vagga-`vagga_source_version`.tar.xz" | tar -xJ -C "$pkgname"
}

package() {
	cd "$pkgname"/vagga
	export DESTDIR="$pkgdir"
	export PREFIX=/usr
	bash install.sh
}
