# Maintainer: Nikolay Arhipov <nikolajs.arhipovs@gmail.com>

pkgname=wuzz
pkgver=0.4.0
pkgrel=1
pkgdesc="Interactive cli tool for HTTP inspection"
arch=('x86_64' 'i686')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
options=('!strip' '!emptydirs')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/asciimoo/wuzz/archive/v${pkgver}.tar.gz")
sha256sums=('acf8e82481740d1403b744c58918b9089128d91c3c6edc15b76b6e1c97ead645')
_goname="github.com/asciimoo/wuzz"


build() {
    rm -rf gopath
    mkdir -p gopath/src/${_goname}
    mv "$srcdir/$pkgname-$pkgver/"* "gopath/src/${_goname}"
    cd "gopath/src/${_goname}"
    env GOPATH="$srcdir/gopath" go get -v
}

package() {
    install -Dm755 "$srcdir/gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
