# $Id: PKGBUILD 173344 2016-05-02 12:35:46Z ronald $
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gdal-hdf4
_pkgname=gdal
pkgver=2.0.2
pkgrel=5
pkgdesc="A translator library for raster geospatial data formats, with support to HDF4 format (required to use MODIStsp tool: http://github.com/lbusett/MODIStsp)"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf'
         'openjpeg2' 'poppler' 'python2' 'python2-numpy' 'cfitsio' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'hdf4-nonetcdf')
makedepends=('perl' 'swig' 'chrpath' 'doxygen')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl:  perl binding support')
options=('!emptydirs')
changelog=$_pkgname.changelog
source=(http://download.osgeo.org/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz
        gdal-python-install.patch)
sha256sums=('db7722caf8d9dd798ec18012b9cacf40a518918466126a88b9fd277bd7d40cc4'
            '823199fdedf5953d9b6bffb0e58a810490e958054f5a9da9d5cd1818f89cd51a')
provides=('gdal')
conflicts=('gdal')


prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -Np0 -i "${srcdir}"/gdal-python-install.patch

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
#FS#46581 no better way found yet
  mv "${pkgdir}"/usr/man/man3 "${pkgdir}"/usr/share/man
  rm -rf "${pkgdir}"/usr/man

# Remove RPATH
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/Const/Const.so
}
