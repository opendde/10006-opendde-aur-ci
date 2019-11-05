# Maintainer: PastLeo <chgu82837@gmail.com>
pkgname=measurement-kit-git
pkgver=r3296.a5f8fc0c
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url='https://github.com/measurement-kit/measurement-kit'
license=('BSD')
groups=()
depends=('openssl' 'libevent' 'curl' 'libmaxminddb')
makedepends=('git' 'cmake')
provides=('measurement-kit')
conflicts=('measurement-kit')
source=('git+git://github.com/measurement-kit/measurement-kit.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
