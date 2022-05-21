# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-recursive
pkgver=1.1.1
pkgrel=1
pkgdesc="A recursive structural transfer module for Apertium"
arch=('i686' 'x86_64')
url="https://wiki.apertium.org/wiki/Apertium-recursive"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.6.4' 'apertium>=3.8.1' 'libxml2>=2.6.17' 'pcre' 'icu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('416ea9c2baf2d2a7151f86ef1e2deedc8b8f21307b3227ddb0623e8eecf735cd')

build() {
	export CXXFLAGS="$CXXFLAGS -I/usr/include/utf8cpp"
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
