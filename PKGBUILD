# Maintainer: Rayr https://rayr.ml/LinkInBio/

pkgname=weather-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="An app made to get weather information through the terminal written in Go"
arch=('x86_64')
url="https://github.com/Rayrsn/Weather-Cli"
license=('GPL')
makedepends=('go')
source=("https://github.com/Rayrsn/Weather-Cli/archive/refs/tags/$pkgver.zip")
md5sums=('f951f6bbd866e1638b555e24f4bdf53b')
build() {
    cd "Weather-Cli-$pkgver"
    go build
}

package() {
	cd "Weather-Cli-$pkgver"
	install -Dm755 "weather-Cli" "$pkgdir/usr/bin/weather-Cli"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
