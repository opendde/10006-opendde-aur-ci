#Maintainer: Aditya Suresh ethanaditya@gmail.com
pkgname='ipmap'
pkgver='0.1.6'
pkgrel=1
pkgdesc="An interactive map that shows connected IP addresses."
arch=('x86_64')
url="https://github.com/skylinecc/ipmap"
license=('GPL')
depends=('libpcap')
makedepends=('rust' 'make')
source=("https://github.com/skylinecc/ipmap/raw/main/packaging/arch/$pkgname-$pkgver.tar.gz")
prepare () {
	cd ../ && pwd && tar -xzf $pkgname-$pkgver.tar.gz
}
#build() {
	#cd ../ && pwd && ls
	#make
#}

package() {
	make DESTDIR="" install
}
md5sums=('d9015ce33d348c283319295640613f71')
