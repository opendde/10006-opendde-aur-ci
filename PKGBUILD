# Maintainer: Jeffrey Feng <galago1992@gmail.com>

pkgbase=poppler-lcd
pkgname=('poppler-lcd' 'poppler-glib-lcd' 'poppler-qt5-lcd')
pkgver=0.76.0
pkgrel=1
arch=(x86_64)
license=('GPL')
makedepends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'gtk3' 'pkgconfig' 'lcms2' 
             'gobject-introspection' 'icu' 'qt5-base' 'git' 'nss' 'gtk-doc' 'curl' 'poppler-data'
             'cmake' 'python') 
options=('!emptydirs')
url="https://poppler.freedesktop.org/"
source=(https://poppler.freedesktop.org/poppler-${pkgver}.tar.xz
        git+https://github.com/jonathanffon/poppler-lcd-patch.git)
sha256sums=('370f5fcfe2bbf0c76fc394d338cd72ed7f2044b67f4eb4b115eb074ccfc70d63'
            'SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd poppler-${pkgver}
  for patch in `ls ../poppler-lcd-patch/*.patch`; do
    patch -p1<$patch
  done
  cd ../build
  cmake ../poppler-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
    -DENABLE_GTK_DOC=ON
  make
}

package_poppler-lcd() {
  pkgdesc="PDF rendering library based on xpdf 3.0 with subpixel patch on LCD display"
  depends=('libjpeg' 'gcc-libs' 'cairo' 'fontconfig' 'openjpeg2' 'lcms2' 'nss' 'curl')
  optdepends=('poppler-data: encoding data to display PDF documents containing CJK characters')
  conflicts=('poppler' "poppler-qt3<${pkgver}" "poppler-qt4<${pkgver}")
  provides=('poppler')
  replaces=('poppler')

  cd build
  make DESTDIR="${pkgdir}" install

  # cleanup for splitted build
  rm -vrf "${pkgdir}"/usr/include/poppler/{glib,qt5}
  rm -vf "${pkgdir}"//usr/lib/libpoppler-{glib,qt5}.*
  rm -vf "${pkgdir}"/usr/lib/pkgconfig/poppler-{glib,qt5}.pc
  rm -vrf "${pkgdir}"/usr/{lib,share}/gir*
  rm -vrf "${pkgdir}"/usr/share/gtk-doc
}

package_poppler-glib-lcd() {
  pkgdesc="Poppler glib bindings with subpixel patch on LCD display"
  depends=("poppler-lcd=${pkgver}" 'glib2')
  conflicts=('poppler-glib')
  provides=('poppler-glib')
  replaces=('poppler-glib')

  cd build

  make -C glib DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-glib.pc "${pkgdir}/usr/lib/pkgconfig/"
  rm -vf "${pkgdir}"/usr/lib/libpoppler.*
  rm -vf "${pkgdir}/usr/bin/poppler-glib-demo"
}

package_poppler-qt5-lcd() {
  pkgdesc="Poppler Qt5 bindings with subpixel patch on LCD display"
  depends=("poppler-lcd=${pkgver}" 'qt5-base')
  conflicts=('poppler-qt5')
  provides=('poppler-qt5')
  replaces=('poppler-qt5')
  
  cd build
  make -C qt5 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 poppler-qt5.pc "${pkgdir}/usr/lib/pkgconfig/"
}

