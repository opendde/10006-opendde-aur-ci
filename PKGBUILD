# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributer: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=lux-dl
pkgver=0.13.0
pkgrel=1
pkgdesc="Fast and simple video download library and CLI tool written in Go"
arch=('x86_64' 'i686')
url="https://github.com/iawia002/lux"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
conflicts=('annie')
replaces=('annie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4fe99247a718dc1038cb6b9b1808c8e836bbf6a8464afefddf4bf8a161b08236')

build(){
    cd lux-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external"
}

package() {
    cd lux-$pkgver
    install -Dm755 lux -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
