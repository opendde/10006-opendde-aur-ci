# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: mrypsilon

pkgbase=gridcoinresearch
pkgname=(gridcoinresearch-qt gridcoinresearchd)
pkgver=5.0.0.0
pkgrel=2
pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network"
makedepends=('boost' 'qt5-charts' 'qt5-tools' 'qrencode' 'db' 'leveldb' 'libzip')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research-$pkgver"

source=("$pkgbase-$pkgver.tar.gz::https://github.com/gridcoin/Gridcoin-Research/archive/$pkgver.tar.gz")

sha256sums=('f46b2207d4524d705a89e039c95a52b7beed69a7b15e17b93bad19e957863018')

# leaving in case needed for future patches
#prepare() {
#    cd "$srcdir/$_sourcename"
#    patch --strip=1 --input="../trafficgraphwidget.cpp.patch"
#}

build() {
  cd "$srcdir/$_sourcename"

  ./autogen.sh
  mkdir -p build && cd build
  ../configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-tests
  make DESTDIR="$srcdir/$_sourcename" install
}

package_gridcoinresearch-qt() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Qt GUI)"
  depends=('boost-libs' 'db' 'miniupnpc' 'qrencode' 'qt5-base' 'qt5-charts')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  cp -r ${srcdir}/${_sourcename}/usr/share ${pkgdir}/usr/share/
  install -Dm644 doc/gridcoinresearch.1 "$pkgdir/usr/share/man/man1/gridcoinresearch.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearchd() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI)"
  depends=('boost-libs' 'db' 'miniupnpc')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')
  replaces=('gridcoinresearch-daemon')
  conflicts=('gridcoinresearch-daemon')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 doc/gridcoinresearchd.1 "$pkgdir/usr/share/man/man1/gridcoinresearchd.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
