# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x64
pkgver=8.0
pkgrel=1
pkgdesc="BrowserStack Local Testing binary - 64bit"
arch=("x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x32")
source=(${url}/archive/v${pkgver}.tar.gz)
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip)
sha512sums=('bc0fddc959087cc07f262b752870d3e0df599970765d1de9d2ba8b74227ce521e94e9eb6871ce730e8b931310a85f9efd3e255caece752db43c21bf74bf79cb5')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/bin/BrowserStackLocal"
}