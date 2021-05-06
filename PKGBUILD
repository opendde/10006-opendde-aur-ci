# Maintainer: tonikelope <tonikelope@gmail.com>
pkgname=coronapoker-bin
pkgver=8.79
pkgrel=1
pkgdesc="Yet another cross-platform Texas hold 'em game written in Java during COVID-19 pandemic"
arch=('x86_64')
url="https://tonikelope.github.io/coronapoker/"
license=('GPL3')

source=("https://github.com/tonikelope/coronapoker/releases/download/v${pkgver}/CoronaPokerLINUX_${pkgver}_portable.zip")

package() {
	mkdir -p "${pkgdir}/opt/coronapoker/"
	chmod 0755 "${pkgdir}/opt/coronapoker/"
	cp -RT "${srcdir}/CoronaPokerLINUX/" "${pkgdir}/opt/coronapoker"
	chmod +x "${pkgdir}/opt/coronapoker/CoronaPoker.run"
	chmod 0777 "${pkgdir}/opt/coronapoker/jar/"
	install -Dm644 "${srcdir}/CoronaPokerLINUX/coronapoker.png" "$pkgdir/usr/share/pixmaps/coronapoker.png"
	install -Dm644 "${srcdir}/CoronaPokerLINUX/coronapoker.desktop" "$pkgdir/usr/share/applications/coronapoker.desktop"
	mkdir -p "${pkgdir}/usr/local/bin/"
	ln -s "/opt/coronapoker/CoronaPoker.run" "$pkgdir/usr/local/bin/coronapoker"
}

md5sums=('49d3a7c3ce2ef06a8d4d24cd9a953a9f')