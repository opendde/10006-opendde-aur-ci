# Maintainer: Your Name <youremail@domain.com>
pkgname=vulkan-kompute-git 
pkgver=r380.9babbc5
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('GPL')
groups=()
depends=()
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('vulkan-kompute::git+https://github.com/EthicalML/vulkan-kompute.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -Bbuild -DKOMPUTE_OPT_INSTALL=1
	make -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" -C build install
}
