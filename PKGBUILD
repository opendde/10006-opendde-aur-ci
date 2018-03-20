# Maintainer: Nathan Kessler <nathant93@gmail.com>
_pkgname=dot-templater
pkgname=${_pkgname}-git
pkgver=r41.f1e6edb
pkgrel=1
pkgdesc="Templates a folder of dotfiles, supporting feature flags and string substitutions"
arch=('i686' 'x86_64')
url="https://github.com/kesslern/dot-templater"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/kesslern/dot-templater')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

check() {
	cd "$srcdir/$_pkgname"
	make RUN_VALGRIND=no test
}

package() {
	cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	make DESTDIR="$pkgdir/usr/bin" install
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
