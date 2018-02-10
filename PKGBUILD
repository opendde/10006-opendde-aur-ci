# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=skafos
pkgver=1.1.0
pkgrel=1
pkgdesc="Skafos CLI tool"
arch=(x86_64)
url="https://metismachine.com"
license=('Apache')
depends=('yaml-cpp>=0.6.0' 'libarchive>=3.3.2' 'libgit2>=1:0.26.0' 'curl>=7.0.0' 'libcurl-compat>=7.0.0')
makedepends=('cmake>=3.0')
install=skafos.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MetisMachine/$pkgname/archive/$pkgver.tar.gz")
md5sums=('55f76b1248cf0dd85882c53c79b09c8a')
sha1sums=('9cfd35623ba9f0279e33a18dfa747e5681cf8e7e')
sha256sums=('d5598c617d03b937c8ecb84e4c0853b88ea874c2e1b6767053dc500e180aac79')
validpgpkeys=()

prepare() {
	cp "../$pkgname-$pkgver.patch" "$srcdir/$pkgname-$pkgver.patch"
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make build_dist
}

package() {
	cd "$pkgname-$pkgver"
	install -D _build/bin/skafos $pkgdir/usr/bin/$pkgname
}
