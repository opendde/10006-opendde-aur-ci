# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-network-utils-git
pkgver=5.3.0.8.r6.g91a3a4e
pkgrel=1
pkgdesc='DDE network utils'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-network-utils"
license=('GPL3')
depends=('deepin-qt-dbus-factory-git' 'gsettings-qt')
makedepends=('git' 'qt5-tools' 'gsettings-qt' 'gtest')
conflicts=('deepin-network-utils')
provides=('deepin-network-utils')
groups=('deepin-git')
source=("$pkgname::git://github.com/linuxdeepin/dde-network-utils.git")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd $pkgname
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}
