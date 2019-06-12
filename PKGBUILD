# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('drill-search-cli' 'drill-search-gtk')
pkgbase=drill-search
pkgver=1.237
pkgrel=1
arch=('x86_64')
url="https://www.drill.santamorena.me/"
license=('GPL2')
makedepends=('dmd' 'dub')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/yatima1460/Drill/archive/$pkgver.tar.gz"
	"$pkgbase"
	"$pkgbase-gtk.desktop"
	"$pkgbase-gtk.svg"
	"DRILL_VERSION")
sha256sums=('95c20baadf7334ca7d32f018796f3027f892e946ac219a34c74207404c9f3e10'
            'b875f928546aee7855cb1db9afc8ab3f1a8a34d43de5bbd62f7076d7ba9f3917'
            '21a6d19b8198816b3a6e406198ee6e4d5ab0da134df26b8342837e810ccc26a9'
            'cbfbcebb2957223eaa9c915780a5d0ac47c1fac70b7944f49e8ffcfe740edc53'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package_drill-search-cli() {
	pkgdesc="Search files without indexing, but clever crawling (CLI version)"
	conflicts=("$pkgname-bin")

	cd "Drill-$pkgver/Source/Frontend/CLI"
	dub build -b release
	
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -r Build/Drill-CLI-linux-$arch-release/Assets $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/DRILL_VERSION $pkgdir/opt/$pkgname/DRILL_VERSION
	echo "$pkgver" >> $pkgdir/opt/$pkgname/DRILL_VERSION
	install -Dm755 Build/Drill-CLI-linux-$arch-release/$pkgname $pkgdir/opt/$pkgname/$pkgname
	install -Dm755 $srcdir/$pkgbase $pkgdir/usr/bin/$pkgname
	echo "/opt/$pkgname/$pkgname" "\$@" >> $pkgdir/usr/bin/$pkgname
}

package_drill-search-gtk() {
	pkgdesc="Search files without indexing, but clever crawling (GTK version)"
	depends=('gtk3')
	conflicts=("$pkgname-bin")

	cd "Drill-$pkgver/Source/Frontend/GTK"
	dub build -b release
	
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -r Build/Drill-GTK-linux-$arch-release/Assets $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/DRILL_VERSION $pkgdir/opt/$pkgname/DRILL_VERSION
	echo "$pkgver" >> $pkgdir/opt/$pkgname/DRILL_VERSION
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
	install -Dm755 Build/Drill-GTK-linux-$arch-release/$pkgname $pkgdir/opt/$pkgname/$pkgname
	install -Dm755 $srcdir/$pkgbase $pkgdir/usr/bin/$pkgname
	echo "/opt/$pkgname/$pkgname" "\$@" >> $pkgdir/usr/bin/$pkgname
}
