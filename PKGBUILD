# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# based on extra/hdf5 and hdf5-1.8.16
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: mickele <mimocciola [at] yahoo [DoT] com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

_pkgname=hdf5
pkgver=1.8.17
pkgname=${_pkgname}-1.8
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data (legacy version with static libs)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time')
install="${pkgname}.install"
source=(ftp://ftp.hdfgroup.org/HDF5/releases/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver/_/-}.tar.bz2)
sha1sums=('640f1a46cb1b353339695355b4fca42df05be765')

build() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"

  ./configure --prefix=/opt/${pkgname} \
    --enable-hl \
    --disable-threadsafe \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"

  make -j1 DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_pkgname}-${pkgver/_/-}/COPYING" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -d -m755 "${pkgdir}/etc/ld.so.conf.d"
  printf "%s\n" "/opt/${pkgname}/lib" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
