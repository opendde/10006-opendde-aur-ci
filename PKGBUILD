# Maintainer: FineFindus <Finefindusgh@gmail.com>
pkgname=artem-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Convert images from multiple formats (jpg, png, webp, etc…) to ASCII art, written in rust'
url='https://github.com/finefindus/artem'
license=('MPL2')
arch=('x86_64' 'aarch64')
provides=('artem')
conflicts=('artem')
source=("https://github.com/FineFindus/artem/releases/download/v$pkgver/artem-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=('c8316a0362c94e4c7f308242f59adae0ae7227a39d29a473d33f1b1f1cf85a9d')

package() {
    install -Dm 755 artem -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 doc/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 doc/artem.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm 644 completions/artem.bash -t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm 644 completions/artem.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
	install -Dm 644 completions/_artem -t "$pkgdir/usr/share/zsh/site-functions"
}
 