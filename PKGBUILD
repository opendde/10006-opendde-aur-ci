# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname="hola-proxy"
pkgver=1.5.5
pkgrel=1
pkgdesc="Standalone Hola proxy client"
arch=(x86_64)
url="https://github.com/Snawoot/hola-proxy"
license=(MIT)
makedepends=(go)
source=("https://github.com/Snawoot/hola-proxy/archive/v${pkgver}.tar.gz")
sha256sums=('a127851b580530b4dc5b9634e96cb39c65caa49f42997819c4647c037108786e')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}"
    
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -o build .
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
