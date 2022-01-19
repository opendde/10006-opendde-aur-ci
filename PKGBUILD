# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
pkgname=shelltestrunner
pkgver=1.9
pkgrel=1
pkgdesc="Easy, repeatable testing of CLI programs/commands"
arch=(x86_64)
url="https://github.com/simonmichael/shelltestrunner"
license=('GPL')
depends=(ghc-libs haskell-cmdargs haskell-diff haskell-filemanip haskell-hunit
         haskell-pretty-show haskell-regex-tdfa haskell-safe haskell-test-framework
		 haskell-test-framework-hunit haskell-utf8-string
		)
makedepends=(ghc)
checkdepends=()
optdepends=()
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cbc4358d447e32babe4572cda0d530c648cc4c67805f9f88002999c717feb3a8')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir="/usr/share/doc/$pkgname" \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm \
		--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
		--ghc-option='-pie' -falpm

	runhaskell Setup build $MAKEFLAGS
}

check() {
	cd "$pkgname-$pkgver"
	#make -k test
}

package() {
	cd "$pkgname-$pkgver"
	runhaskell Setup copy --destdir="$pkgdir"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	# there are no docs
	rmdir "$pkgdir/usr/share/doc/$pkgname"
	rmdir "$pkgdir/usr/share/doc"
}
