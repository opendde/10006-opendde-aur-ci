# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-svg-git
pkgver=5.12.1.r11.g2ae3c52
pkgrel=3
pkgdesc="Qt5 SVG module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('FDL' 'GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('git')
provides=('qt5-svg')
conflicts=('qt5-svg')
source=("git+https://code.qt.io/qt/qtsvg.git#branch=dev")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtsvg"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "_build"

  qmake ../qtsvg
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  cd "$srcdir/qtsvg"
  install -Dm644 "LICENSE.GPL3-EXCEPT" "$pkgdir/usr/share/licenses/qt5-svg/LICENSE.GPL3-EXCEPT"
}
