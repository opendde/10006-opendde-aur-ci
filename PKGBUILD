# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# Globe Plugin and Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like them enabled.
# You will also need to install osgearth or fcgi, respectively, before building.

pkgname=qgis-git
_pkgname=qgis
pkgver=2.99
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats - Development master'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt5-base' 'proj' 'geos' 'sqlite3' 'gdal' 'qwt' 'expat' 'python-qscintilla-qt5')
makedepends=('git' 'cmake' 'flex' 'bison')
optdepends=('grass: for GRASS providers and plugin (6 or 7)'
            'gsl: for georeferencer'
            'postgresql: for postgis and SPIT support'
            'gpsbabel: for gps plugin'
            'python: for mapserver and PyQGIS'
            'python-sip: for python support'
            'pyqt: for python support'
            'fastcgi: for qgis mapserver'
            'ocilib: oracle provider')

#install="$_pkgname.install"
source=("${_pkgname}::git://github.com/qgis/QGIS.git")
md5sums=('SKIP')
conflicts=('qgis')

prepare() {
  cd $_pkgname

  # Fixing shebang for .py files
  # sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -iname "*.py")

  # Remove mime types already defined by freedesktop.org
  sed -e '/type="image\/tiff"/,/<\/mime-type>/d' \
      -e '/type="image\/jpeg"/,/<\/mime-type>/d' \
      -e '/type="image\/jp2"/,/<\/mime-type>/d' \
      -e '/type="application\/x-adobe-mif"/,/<\/mime-type>/d' \
      -i debian/qgis.xml

  # Fix console.py for new pyqt build system
  #sed -e '/from PyQt4.QtCore/ s/$/, QT_VERSION/' \
  #    -e '/import pyqtconfig/d' \
  #    -e 's/pyqtconfig.*qt_version/QT_VERSION/' \
  #    -i python/console/console.py
  
  sed -i 's/QWT_LIBRARY_NAMES qwt-qt5 qwt6-qt5/QWT_LIBRARY_NAMES qwt qwt-qt5 qwt6-qt5/'  cmake/FindQwt.cmake

  [[ -d build ]] || mkdir build
}

build() {
  cd $_pkgname/build
  
  cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DENABLE_TESTS=FALSE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_INTERNAL_{HTTPLIB2,JINJA2,MARKUPSAFE,OWSLIB,PYGMENTS,DATEUTIL,PYTZ,YAML,NOSE2,SIX,FUTURE}=FALSE \
#    -DWITH_SERVER=TRUE \
#    -DWITH_GLOBE=TRUE

  make
}

package() {
  cd $_pkgname/build

  # Add optional deps based on selected or autodetected options
  [[ -n "$(sed -n '/^GRASS_PREFIX:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass6: GRASS6 plugin')
  [[ -n "$(sed -n '/^GRASS_PREFIX7:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass: GRASS7 plugin')
  [[ "$(sed -n '/^WITH_SERVER:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('fcgi: Map Server')
  [[ "$(sed -n '/^WITH_GLOBE:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('osgearth: Globe plugin')

  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_pkgname"

  # install desktop files and icons
  install -Dm644 debian/{qgis,qbrowser}.desktop -t "$pkgdir/usr/share/applications/"
  for icon in qgis-icon{,-16x16,-60x60} qbrowser-icon{,-60x60}; do
    local _resolution="${icon##*-}"; [[ "$_resolution" == "icon" ]] && _resolution="512x512"
    install -Dm644 images/icons/$icon.png "$pkgdir/usr/share/icons/hicolor/$_resolution/apps/${icon%%-*}.png"
  done
  for icon in {qgis,qbrowser}_icon; do
    install -Dm644 images/icons/$icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${icon%%_*}.svg"
  done

  # install mime information and icon
  install -Dm644 debian/qgis.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
  install -Dm644 images/icons/qgis-mime-icon.png "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/qgis-mime.png"

  # compile python files, since the cmake option doesn't seem to account for DESTDIR
  python2 -m compileall -q "$pkgdir"
}
