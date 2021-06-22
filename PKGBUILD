# Maintainer: Nguyen Hong Hiep (justanoobcoder)
# Github: https://github/justanoobcoder

pkgname=nowater
pkgver=21.06
pkgrel=1
pkgdesc="A CLI tool that helps you set wallpaper or live wallpaper easily."
arch=(any)
url="https://github.com/justanoobcoder/nowater"
license=('GPL3')
depends=('feh' 'wget' 'jq' 'ffmpeg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname-$pkgver"
    printf "%s" "$(awk -F '"' '/^version/ {print $2}' $pkgname)"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
