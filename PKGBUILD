pkgname=rocksdb-ldb
pkgver=6.11.4
pkgrel=1
pkgdesc='The 'ldb' from the RocksDB storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(Apache leveldb)
depends=(
    'bzip2'
    'gcc-libs'
    'lz4'
    'snappy'
    'zlib'
    'gflags'
)
makedepends=('gcc' 'make' 'diffutils')
source=(https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz)
sha256sums=('6793ef000a933af4a834b59b0cd45d3a03a3aac452a68ae669fb916ddd270532')
provides=(rocksdb-ldb)

prepare() {
  ls -alh
  cd "rocksdb-$pkgver"
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ ""  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd "rocksdb-$pkgver"
  make clean
  DISABLE_WARNING_AS_ERROR=1 DEBUG_LEVEL=0 make ldb -j4
}

package() {
  cd "rocksdb-$pkgver"
  install -m755 -D ldb "$pkgdir"/usr/bin/rocksdb-ldb
}
