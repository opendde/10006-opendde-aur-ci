# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=qtutilities
pkgver=6.7.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models'
license=('GPL')
depends=('libc++utilities.so' 'qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools' 'mesa')
optdepends=("$pkgname-doc: API documentation")
provides=(libqtutilities.so)
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('1ac2fe87f90de9b9ebc5e471ffb799c66e07234be0134def6a8be821a1cf2204')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  QT_QPA_PLATFORM=offscreen ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
