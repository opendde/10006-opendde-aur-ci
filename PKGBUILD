
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nodejs-telegraf
_pkgname=${pkgname#*-}
pkgver=3.21.0
pkgrel=1
pkgdesc='Modern Telegram Bot Framework for Node.js'
arch=('any')
url='https://telegraf.js.org/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/telegraf/$_pkgname/archive/$pkgver.tar.gz")
noextract=("$_pkgname-$pkgver.tar.gz")
sha256sums=('5a5c3965fd31f558f2c5d7974671f6eebbdf25979ad522e2d12db419c7827ae6')

package() {
    cd "$srcdir"

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$_pkgname-$pkgver.tar.gz"

    install -Dm644 \
        "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

