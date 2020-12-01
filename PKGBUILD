# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=coreterminal
pkgver=4.1.0
pkgrel=1
pkgdesc="A terminal emulator from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-serialport' 'libcprime>=2.7.1' 'qtermwidget')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('556c8a27190329b34d68d268810e77e2')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
