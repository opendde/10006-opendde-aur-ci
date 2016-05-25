# Maintainer: Lukas Jirkovsky <l.jirkovsky AT gmail.com>
pkgname=photivo-hg
pkgver=1117.5d7d1cc4ef4d
pkgrel=1
pkgdesc="Free and open source photo processor"
arch=('i686' 'x86_64')
url="http://photivo.org/"
license=('GPL3')
depends=('exiv2' 'qt4' 'lcms2' 'fftw' 'graphicsmagick' 'lensfun' 'liblqr' 'shared-mime-info')
optdepends=('gimp: Gimp plugins' 'python2: Gimp to Photivo plugin')
makedepends=('mercurial' 'gimp')
provides=('photivo')
conflicts=('photivo')
source=('hg+https://bitbucket.org/Photivo/photivo')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/photivo"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/photivo"

  # pull build fixes
  hg pull -u https://stativ@bitbucket.org/stativ/photivo
}

build() {
  cd "$srcdir/photivo"

  export INCLUDEPATHS="/usr/include/lensfun"
  qmake-qt4 PREFIX=/usr CONFIG-=debug CONFIG+=WithGimp
  make
}

package() {
  cd "$srcdir/photivo"

  # do not install local the shortcut to the home
  sed '/^install:/ s|install_shortcut2 ||' -i Makefile

  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir"/home

  # GIMP integration
  install -D -m755 ptGimp "$pkgdir/usr/lib/gimp/2.0/plug-ins/ptGimp"
  install -D -m755 "mm extern photivo.py" "$pkgdir/usr/lib/gimp/2.0/plug-ins/mm-extern-photivo.py"
}
