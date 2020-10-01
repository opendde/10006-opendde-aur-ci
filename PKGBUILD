# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
# Contributor: Raansu <Gero3977@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=db-4.8-raspi4-magi
pkgver=4.8.30
pkgrel=1
pkgdesc="The Berkeley DB embedded database system 4.8 - This is meant only to be used as a dependency for magiwallet-magid-raspi4-git"
arch=('aarch64')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz
        'db-atomic.patch'
        'CVE-2017-10140-cwd-db_config.patch'
        'addraspi4.patch')
md5sums=('f80022099c5742cd179343556179aa8c'
        'd56cef85d0fc9432b54a32993d4c9f06'
        'c2d29f72c20625c09f30e35af3c4f2ff'
        '3cd79ed62a089b20b33e163146d5aabd')

sha256sums=('e0491a07cdb21fb9aa82773bbbedaeb7639cbd0e7f96147ab46141e0045db72a'
            '7ab718c5624b4724a585c91f4cfdcd3830cfaf0ce1e865a4a79b316ba35990c0'
            '7dfea34368f4d3d5b81973f7b0dbb8a54cdd09effb09b2b28763b2470833a614'
            'c059d699a2202b8d321d053214f3d190cdfec174c589d1fee65fd7b7b73c2ec4')

prepare() {
  cd "$srcdir/db-$pkgver/"

  chmod +w dbinc/atomic.h
  patch -p1 < "$srcdir"/db-atomic.patch
  
  chmod +w env/env_open.c
  patch -u -p1 < "$srcdir"/CVE-2017-10140-cwd-db_config.patch

  chmod +w dist/config.sub
  patch -u -p1 < "$srcdir"/addraspi4.patch
}

build() {
  cd "$srcdir/db-$pkgver/"

  cd "build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 --enable-shared --disable-static --enable-cxx --build=raspi4
  make LIBSO_LIBS=-lpthread || return 1
}

package() {  
  cd "$srcdir/db-$pkgver/"
  
  cd "build_unix"
  make prefix="$pkgdir/usr" includedir="$pkgdir/usr/include/db4.8" install

# Remove documents to save space, these can be found online if needed.
  rm -rf "$pkgdir/usr/docs"

# Remove conflicting symlinks created by make, should never overwrite 
# main libdb symlinks to current version. Programs that need or use 
# db4.8 should be able to find it.
  rm -f "$pkgdir/usr/lib/libdb.so"
  rm -f "$pkgdir/usr/lib/libdb_cxx.so"
  rm -f "$pkgdir/usr/lib/libdb-4.so"
  rm -f "$pkgdir/usr/lib/libdb_cxx-4.so"
  mkdir "$pkgdir/usr/newlib/"
  chmod -R 755 "$pkgdir/usr/newlib"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/newlib/db-4.8"
  mv "$pkgdir/usr/newlib" "$pkgdir/usr/lib"

# Rename db4.8 bin files to not conflict with current db version 
# installed. Programs that need or use db4.8 should be aware of this 
# name change. 
  cd "$pkgdir/usr/bin"
  for i in *; do
    mv $i db4.8_${i/db_/}
  done
  ln -s "/usr/lib/db-4.8/libdb_cxx-4.8.so" "$pkgdir/usr/lib/libdb_cxx-4.8.so"
# Install license.
  install -Dm644 "$srcdir/db-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
