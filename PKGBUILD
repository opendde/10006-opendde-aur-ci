# Maintainer: kedap <kedap.dev@protonmail.com>

pkgname=apmpkg
pkgver=1.5.0
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
optdepends=('flatpak: for install dependencies'
  'snapd: for install dependencies')
depends=('git' 'python-pip' 'python2-pip' 'wget' 'fakeroot' 'ruby-bundler' 'rsync' 'npm')
makedepends=('cargo')
conflicts=('apmpkg-git-dev' 'apmpkg-dev')
source=("https://github.com/Kedap/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6b4fb5048d29d08575c2b689fa8ccb7e895cd2338437598c0e3bdba3abb5c87c')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/etc/apmpkg/iiabc
	cp -r src/iiabc/ ${pkgdir}/etc/apmpkg/
	mkdir -p ${pkgdir}/etc/apmpkg/paquetes
        install -Dm 644 "man/${pkgname}.1" -t ${pkgdir}/usr/share/man/man1
        install -Dm 644 "man/${pkgname}-en.1" -t ${pkgdir}/usr/share/man/man1
}
