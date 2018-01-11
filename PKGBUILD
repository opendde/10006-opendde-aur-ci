# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5_18
_pkgname=hdf5
pkgver=1.8.20
pkgrel=2
arch=(i686 x86_64)
pkgdesc='General purpose library and file format for storing scientific data'
url='http://www.hdfgroup.org/HDF5/'
license=(custom)
depends=(zlib sh)
makedepends=(time)
source=(https://support.hdfgroup.org/ftp/HDF5/current18/src/$_pkgname-$pkgver.tar.bz2)
sha512sums=(fee482386ef304b33999795bb427b4d78dbfeb5bf23c8e7b032b93a4f251b0340729e87d74c658ef984b515f767b73282a3278400bdad81d9292e72a990fcaf6)

build() {
  cd $srcdir/$_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-hl \
    --enable-threadsafe \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5_18/ \
    --with-pthread=/usr/lib \
    --disable-sharedlib-rpath \
    --libdir=/usr/lib/hdf5_18 \
    --includedir=/usr/include/hdf5_18

  make -j`nproc`
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make -j`nproc` DESTDIR=$pkgdir install

  # don't install examples
  rm -rf $pkgdir/usr/share/hdf5_examples

  # rename executables to not conflict with hdf5 package
  for file in $pkgdir/usr/bin/*; do
    mv $file ${file}_18
  done

  # add hdf5 library path to dynamic linker configuration include directory
  install -dm 755 $pkgdir/etc/ld.so.conf.d
  echo /usr/lib/hdf5_18 >> $pkgdir/etc/ld.so.conf.d/hdf5_18.conf

  # install license
  install -Dm 644 $srcdir/$_pkgname-$pkgver/COPYING \
                  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
