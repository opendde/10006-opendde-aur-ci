# Maintainer: a821

pkgname=litecoin-daemon
pkgver=0.21.2.1
pkgrel=1
arch=('x86_64')
url="https://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency (includes litecoind and litecoin-cli)"
depends=('boost-libs' 'db4.8' 'fmt' 'libevent' 'miniupnpc' 'openssl' 'sqlite' 'zeromq')
makedepends=('boost')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/litecoin-project/litecoin/archive/refs/tags/v${pkgver}.tar.gz"
        "Fix-build-with-Boost-1.77.0.patch")
sha256sums=('533516ebbf5f4efa5b2a789cb93ae9805172c1f547d6cd77c1e8f2bd0e89e00c'
            '0eb6bb4bb1c82560b063da9e0c2d0404df90637ab13b5db4a75f7959e29bfa44')

prepare() {
    cd litecoin-${pkgver}
    patch -p1 < ../Fix-build-with-Boost-1.77.0.patch
}

build() {
    cd litecoin-${pkgver}
    ./autogen.sh
    ./configure --prefix=/usr --without-gui
    make
}

package() {
    cd litecoin-${pkgver}
    # make DESTDIR="${pkgdir}" install # for standard install
    install -Dm755 -t "$pkgdir/usr/bin" src/litecoin{d,-cli}
    install -Dm644 -t "$pkgdir/usr/share/man/man1" doc/man/litecoin{d,-cli}.1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
