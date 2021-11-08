# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=('otf-yrsa' 'ttf-yrsa')
pkgbase=yrsa-font
pkgver=2.003
pkgrel=1
pkgdesc='Serif font for continuous reading on the web'
arch=(any)
url="https://github.com/rosettatype/yrsa-rasa"
license=('OFL')
groups=('yrsa-rasa-fonts')
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/Yrsa-fonts-v$pkgver.zip")
sha256sums=('778f3fd7fc774b2da3bd0960fff47dfa5d71038073300076ffafedbc1dd2ad2f')

_package() {
	cd "Yrsa-fonts-v$pkgver"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

	# txt file is actually a Markdown file:
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_otf-yrsa() {
	conflicts=('ttf-yrsa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" otf/*.otf
}

package_ttf-yrsa() {
	conflicts=('otf-yrsa')
	_package
	install -Dm644 -t "$pkgdir/usr/share/fonts/${pkgbase%-font}" ttf/*.ttf
}
