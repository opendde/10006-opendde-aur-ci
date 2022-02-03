# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lagrange-git
pkgver=1.10.3.r7.ga7163a05
pkgrel=1
pkgdesc="A desktop GUI client for browsing Geminispace"
arch=('i686' 'x86_64')
url="https://gmi.skyjake.fi/lagrange/"
license=('BSD')
depends=('glibc' 'hicolor-icon-theme' 'libunistring' 'openssl' 'pcre' 'sdl2' 'zlib')
makedepends=('git' 'cmake' 'zip')
optdepends=('mpg123')
provides=('lagrange')
conflicts=('lagrange')
source=("git+https://github.com/skyjake/lagrange.git")
sha256sums=('SKIP')


prepare() {
  cd "lagrange"

  git submodule update --init --recursive
}

pkgver() {
  cd "lagrange"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "lagrange"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "lagrange"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/lagrange"
}
