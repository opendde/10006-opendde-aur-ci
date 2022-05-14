# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_with_plasma=false

pkgname=optimus-manager-qt
pkgver=1.6.7
pkgrel=2
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu'
arch=(x86_64)
url=https://github.com/Shatur/optimus-manager-qt
license=(GPL3)
depends=(qt5-base qt5-svg qt5-x11extras 'optimus-manager>=1.4')
makedepends=(qt5-tools extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver-source.tar.gz)
sha256sums=(e84c2f9de884dc07cb4486d0baa30e8251a4ed10e4eb570ed4cb7d65c82ab556)

if [[ $_with_plasma == true ]]
then
  depends+=(knotifications kiconthemes)
fi

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  if [[ $_with_plasma == true ]]
  then
      cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -D WITH_PLASMA=ON ..
  else
      cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  fi

  cmake --build .
}

package() {
  cd $pkgname-$pkgver/build

  cmake --install .
  rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
