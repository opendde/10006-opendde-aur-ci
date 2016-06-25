# Maintainer: Tony <tony@criticalstack.com>

pkgname=rocksdb-static
pkgver=4.6.1
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (static library)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(BSD)
depends=(gperftools zlib bzip2 lz4 snappy gcc-libs)
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/rocksdb-$pkgver.zip)
sha256sums=('112b4e9ddaf7b53dba87e34208f59664e5aaf28d74487c7ed5dc61c70acfdc5f')

prepare() {
  cd rocksdb-rocksdb-$pkgver
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd rocksdb-rocksdb-$pkgver
  make static_lib
}

package() {
  cd rocksdb-rocksdb-$pkgver
  install -m755 -D librocksdb.a "$pkgdir"/usr/lib/librocksdb.a
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
