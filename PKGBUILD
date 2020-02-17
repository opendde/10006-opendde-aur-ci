#Maintainer: Mathias Roux <poussinberlin@gmail.com>
#Based on the official kdeconnect PKGBUILD
pkgname=kdeconnect-bluetooth
pkgver=1.4
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone, with a bluetooth backend'
url='https://community.kde.org/KDEConnect'
license=(GPL)
arch=(x86_64)
depends=(hicolor-icon-theme kcmutils kwayland libfakekey qca kpeoplevcard pulseaudio-qt kirigami2)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'bluez: Basic bluetooth support')
provides=('kdeconnect')
source=("https://download.kde.org/stable/kdeconnect/$pkgver/$pkgname-kde-$pkgver.tar.xz"{,.sig})
sha256sums=('caee7945a9d9bb881a943dc8d2fd0d702c04da5bdb2df14d4f875e7cf5d5261a'
            'SKIP')
prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-kde-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib\
    -DBLUETOOTH_ENABLED=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
