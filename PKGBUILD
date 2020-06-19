# Maintainer: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf@gmail.com> 
# (non-snap)Maintainer: Antonio Rojas <arojas@archlinux.org> 

_pkgname=discover
pkgname=discover-snap
pkgver=5.19.0
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI with snap support'
arch=(x86_64)
url='https://userbase.kde.org/Discover'
license=(LGPL)
conflicts=(discover)
provides=(discover)
depends=(knewstuff kitemmodels kdeclarative qt5-graphicaleffects appstream-qt archlinux-appstream-data
         hicolor-icon-theme kirigami2 discount kuserfeedback snapd snapd-glib)
makedepends=(extra-cmake-modules plasma-framework packagekit-qt5 flatpak fwupd)
optdepends=('packagekit-qt5: to manage packages from Arch Linux repositories' 'flatpak: Flatpak packages support'
            'fwupd: firmware update support')
groups=(plasma)
source=("https://download.kde.org/stable/plasma/${pkgver}/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('05c5170227e5664914fc18b865a89b68ee699d53d6e4f57dd2b9dddbb02a4445'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_SnapBackend=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}


