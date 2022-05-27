# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('tuf')
_pkgname=('go-tuf')
pkgver=0.3.0
pkgrel=1
pkgdesc="Implementation of The Update Framework"
arch=('x86_64')
license=('BSD')
url="https://github.com/theupdateframework/go-tuf"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=('glibc')
makedepends=('go' 'git')
sha256sums=('0b988234a9cb7d05442dac2f4fd07649e63acebecd1d9ac407f7144b231dee11')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    go build -o tuf ./cmd/tuf/main.go
    go build -o tuf-client ./cmd/tuf-client/main.go
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" tuf
    install -Dm 755 -t "${pkgdir}/usr/bin" tuf-client
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
