# $Id: PKGBUILD 185286 2016-08-05 12:21:10Z andyrtr $
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gdal-hdf4
_pkgname=gdal
pkgver=2.1.1
pkgrel=1
pkgdesc="A translator library for raster geospatial data formats, with support to HDF4 format (required to use MODIStsp tool: http://github.com/lbusett/MODIStsp)"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf' 'hdf4-nonetcdf'
         'openjpeg2' 'poppler' 'python2' 'python2-numpy' 'cfitsio' 'sqlite' 'libmariadbclient' 'postgresql-libs')
makedepends=('perl' 'swig' 'chrpath' 'doxygen')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl:  perl binding support')
provides=('gdal')
conflicts=('gdal')
options=('!emptydirs')
changelog=$_pkgname.changelog
source=(http://download.osgeo.org/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('87ce516ce757ad1edf1e21f007fbe232ed2e932af422e9893f40199711c41f92')

prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver

# python2 fixes
  sed -i 's_python python1.5_python2 python python1.5_' configure
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure
}

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

# bug #23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed" 

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
              --with-mysql --with-python=/usr/bin/python2 --with-curl --with-hdf4 --with-hdf5 --with-perl --with-geos \
              --with-png --with-poppler --with-spatialite --with-openjpeg

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  make
  make man
}

package () {
  cd "${srcdir}"/$_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

# install license
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/$_pkgname/LICENSE

#FS15477 clean up junks
  rm -f "${pkgdir}"/usr/bin/*.dox
  rm -f "${pkgdir}"/usr/share/man/man1/_build_gdal_src_gdal-${pkgver}_apps_.1
  rm -f "${pkgdir}"/usr/share/man/man1/_home_rouault_dist_wrk_gdal_apps_.1
#FS#46581 no better way found yet
  mv "${pkgdir}"/usr/man/man3 "${pkgdir}"/usr/share/man
  rm -rf "${pkgdir}"/usr/man

# Remove RPATH
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/Const/Const.so
}
