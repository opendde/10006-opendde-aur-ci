# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.13.0'
pkgrel='1'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
makedepends=()
checkdepends=()
provides=('starship')
conflicts=('starship')
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1276432b0f7b594136db1bf504f1776ad9c8a7be8b9fcb3cfacabf2f6d7a6935')
PKGEXT='.pkg.tar.gz'

package() {
    cd "x86_64-unknown-linux-gnu"
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
