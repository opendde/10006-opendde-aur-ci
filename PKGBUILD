# on the base of Gentoo gwyddion ebuild
# http://packages.gentoo.org/package/sci-visualization/gwyddion

pkgname=gwyddion
pkgver=2.46
pkgrel=1
pkgdesc="A data visualization and processing tool for scanning probe miscroscopy (SPM, i.e. AFM, STM, MFM, SNOM/NSOM, ...) and profilometry, useful also for general image and 2D data analysis"
#A modular program for SPM (scanning probe microscopy) and other 2D (height field) data visualization and analysis"
url="http://gwyddion.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=(gtk2 pango cairo gtkglext desktop-file-utils python2 pygtk 
         hicolor-icon-theme openexr fftw libunique)
#depends=('freeglut' 'gtksourceview')
makedepends=('pkgconfig')
optdepends=('libxmu: for alternative "remote control" backend'
            'gconf: better GNOME and XFce integration (SPM file thumbnails)'
            'libxml2: SPML file support'
            'zlib: Matlab MAT5 file support'
            'perl: development of plug-in'
            'ruby: development of plug-in'
            'fpc: development of plug-in'
            'gtksourceview2: Pygwy console syntax highlighting')
install=gwyddion.install
source=(http://downloads.sourceforge.net/sourceforge/gwyddion/$pkgname-$pkgver.tar.xz
        http://gwyddion.net/download/2.46/gwyddion-2.46-jpkscan-no-minizip.patch)
sha256sums=('3f2600288b38e0253fccaff67a632c7dadbdec7f645200f0d86e1131662490e9'
            '53b30f10cb1d708bf6213a789259dd9748790c5e6670cd8b2c5ba3c205e48a67')

prepare() {
  cd $pkgname-$pkgver

  # python2 fix
  for file in $(find . -name '*.py' -print); do
      sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  patch -Np1 -i "${srcdir}/gwyddion-2.46-jpkscan-no-minizip.patch"

}

build() {
  cd $pkgname-$pkgver

#  ./configure --prefix=/usr --disable-desktop-file-update \
#		--disable-rpath \
#		--enable-library-bloat \
#		--enable-plugin-proxy \
#              --disable-updater --disable-schemas-compile \


  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --libexecdir=/usr/lib \
              --disable-schemas-install \
              PYTHON=python2
  make PYTHON=python2
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 PYTHON=python2 install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"

  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gwyddion ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}




