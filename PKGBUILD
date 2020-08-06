pkgname=devilspie2
pkgver=0.43
pkgrel=1
pkgdesc="A window matching utility, allowing the user to perform scripted actions on windows as they are created."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/$pkgname/"
license=('GPL3')
depends=('lua>=5.1' 'gtk3' 'libwnck3')
source=("http://download.savannah.nongnu.org/releases/$pkgname/${pkgname}_$pkgver-src.tar.gz"{,.asc}
        "$pkgname-0.43-lua-5.4.patch")
md5sums=('26eed0b5b4af5c7e13c551eceaeab832'
         'SKIP'
         '8fd96127706934b138af50aaa2da0664')
validpgpkeys=('DB306E4B10FFD98EF4DB55D7194B631AB2DA2888') # Andreas Rönnquist <gusnan@gusnan.se>

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-0.43-lua-5.4.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install

	# Install documentation
	mkdir -p -m755 "$pkgdir/usr/share/doc"
	cp -Rp doc/ "$pkgdir/usr/share/doc/$pkgname"
	install -Dp -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set ft=sh ts=4 sw=4 noet:
