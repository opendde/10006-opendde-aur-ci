# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgbase=litecoin-git
pkgname=('litecoin-daemon-git' 'litecoin-cli-git' 'litecoin-qt-git' 'litecoin-tx-git')
pkgver=0.15.1rc1+0+gf496412ed
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
makedepends=('git' 'boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
license=('MIT')
source=(
  "$pkgbase::git+https://github.com/litecoin-project/litecoin.git#branch=0.15"
  'litecoin-qt.desktop'
)
sha256sums=('SKIP'
            'ec2a2669a50fa96147a1d04cacf1cbc3d63238aee97e3b0df3c6f753080dae96')

pkgver() {
    cd "$pkgbase"
    git describe --long --tags | sed 's/-/+/g; s/^v//'
}

build() {
  cd "$pkgbase"
  ./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb
  make
}

package_litecoin-qt-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - Qt"
  depends=(boost-libs desktop-file-utils libevent qt5-base miniupnpc qrencode protobuf zeromq)
  conflicts=(litecoin-qt)
  provides=(litecoin-qt)

  cd "$pkgbase"
  install -Dm755 src/qt/litecoin-qt "$pkgdir"/usr/bin/litecoin-qt
  install -Dm644 "$srcdir"/litecoin-qt.desktop \
    "$pkgdir"/usr/share/applications/litecoin.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/litecoin128.png
  install -Dm644 doc/man/litecoin-qt.1 \
    "$pkgdir"/usr/share/man/man1/litecoin-qt.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_litecoin-daemon-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs libevent miniupnpc zeromq)
  conflicts=(litecoin-daemon)
  provides=(litecoin-daemon)

  cd "$pkgbase"
  install -Dm755 src/litecoind "$pkgdir"/usr/bin/litecoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/litecoin.conf"
  install -Dm644 doc/man/litecoind.1 \
    "$pkgdir"/usr/share/man/man1/litecoind.1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_litecoin-cli-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - RPC client"
  depends=(boost-libs libevent)
  conflicts=(litecoin-cli)
  provides=(litecoin-cli)

  cd "$pkgbase"
  install -Dm755 src/litecoin-cli "$pkgdir"/usr/bin/litecoin-cli
  install -Dm644 doc/man/litecoin-cli.1 \
    "$pkgdir"/usr/share/man/man1/litecoin-cli.1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_litecoin-tx-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(boost-libs openssl)
  conflicts=(litecoin-tx)
  provides=(litecoin-tx)

  cd "$pkgbase"
  install -Dm755 src/litecoin-tx "$pkgdir"/usr/bin/litecoin-tx
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
