# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc4
pkgver=4.2.12.118
_rls_tag=v4.2.12
pkgrel=1
pkgdesc="DigiDoc4 Client is an application for digitally signing and encrypting documents; the software includes functionality to manage Estonian ID-card - change pin codes, update certificates etc."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'qt5-svg' 'libdigidocpp>=3.14.10' 'libldap' 'pcsclite' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'qt5-translations' 'git')
optdepends=('opensc: smart card support'
            'ccid: smart card support')
source=("$pkgname-$pkgver::git+https://github.com/open-eid/DigiDoc4-Client.git?signed#tag=$_rls_tag"
        "open-eid-cmake::git+https://github.com/open-eid/cmake.git"
        "open-eid-common::git+https://github.com/open-eid/qt-common.git"
        "open-eid-extensions::git+https://github.com/open-eid/digidoc-extensions.git"
        )
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")
validpgpkeys=(
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir "$pkgname-build"

  git submodule init
  git config submodule.cmake.url $srcdir/open-eid-cmake
  git config submodule.common.url $srcdir/open-eid-common
  git config submodule.extensions.url $srcdir/open-eid-extensions
  git submodule update
}

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
  export BUILD_NUMBER=${pkgver##*.}
  cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
           -DQT_DIR="/usr/lib/cmake/Qt5"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
