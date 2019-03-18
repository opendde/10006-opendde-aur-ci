# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=phonon-qt4
pkgver=4.10.2
pkgrel=5
pkgdesc="The multimedia framework for KDE4"
arch=('x86_64' 'i686')
optdepends=('pulseaudio: PulseAudio support')
makedepends=('extra-cmake-modules' 'libpulse' 'qt4')
url='http://phonon.kde.org/'
install="phonon-qt4.install"
license=(LGPL)
source=("https://download.kde.org/stable/${pkgname%-qt4}/$pkgver/${pkgname%-qt4}-$pkgver.tar.xz"{,.sig})
sha256sums=('34edb1985778575eb7004e4e45151cd7bc995f61ddd6ce3b050b97b7bd778809'
            'SKIP')
validpgpkeys=('CB9387521E1EE0127DA804843FDBB55084CC5D84') # Harald Sitter <sitter@kde.org>

build() {
  mkdir -p build && cd build
  cmake ../${pkgname%-qt4}-$pkgver \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHONON_INSTALL_QT_EXTENSIONS_INTO_SYSTEM_QT=ON \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  depends=(qt4 libpulse)
  optdepends+=('phonon-qt4-backend: !!! REQUIRED FOR PHONO TO WORK AT ALL !!!')

  cd build
  make DESTDIR="$pkgdir" install

  # Install headers into the Qt4 dir
  install -d "$pkgdir"/usr/include/qt4
  mv "$pkgdir"/usr/include/{phonon,KDE} "$pkgdir"/usr/include/qt4/

  sed -i 's#includedir=/usr/include#includedir=/usr/include/qt4#' \
    "$pkgdir/usr/lib/pkgconfig/phonon.pc"
}
