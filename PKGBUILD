# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-doc
pkgver=1.0.14
pkgrel=1
pkgdesc="HTML documentation for LSP Plugins"
arch=('any')
url="http://lsp-plug.in"
license=('custom')
source=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname}-$pkgver.tar.gz")
sha1sums=('ed8072bd440f51137aac48d2582d2f349f6eea40')

package() {
	cd $srcdir
	install -dm644 "$pkgdir/usr/share/doc/$pkgname/"
	for file in $(find "$pkgname-$pkgver/" -type f); do
	     if [ ${file##*/} != LICENSE.txt ]; then
             install -m 644 -D ${file} $pkgdir/usr/share/doc/$pkgname/${file#"$pkgname-$pkgver/"}
		 fi
	done
	install -Dm644 $pkgname-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
