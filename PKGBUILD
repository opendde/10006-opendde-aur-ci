# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=zcoin-git
pkgver=221.61cca65
pkgrel=1
pkgdesc='The Zerocoin Cryptocurrency'
arch=('any')
url='https://github.com/zcoinofficial/zcoin'
license=('MIT')
depends=('db' 'boost' 'miniupnpc' 'qt5-base' 'qt5-tools' 'openssl-1.0')
source=("$pkgname::git+https://github.com/zcoinofficial/zcoin.git"
        "${pkgname/-git/}.desktop")
md5sums=('SKIP'
         '2e3eff2f4fd362a84687979ebb136867')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    qmake-qt5 OPENSSL_INCLUDE_PATH="/usr/include/openssl-1.0" OPENSSL_LIB_PATH="/usr/lib/openssl-1.0" -o Makefile zcoin.pro
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname/zcoin-qt" "$pkgdir/usr/bin/zcoin-qt"
    install -Dm644 "$srcdir/$pkgname/src/qt/res/icons/zcoin.png" "$pkgdir/usr/share/icons/zcoin.png"
    install -Dm644 "${pkgname/-git/}.desktop" "$pkgdir/usr/share/applications/${pkgname/-git/}.desktop"
}
