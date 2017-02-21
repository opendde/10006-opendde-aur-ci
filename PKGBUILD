# Maintainer: Lars Hagström <lars@foldspace.nu>
# Contributor: Nephyrin Zey <nephyrin@doublezen.net>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Geoffrey Teale <tealeg@googlemail.com>
pkgname=google-breakpad-git
pkgver=r1595.4e82b6fa
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('depot-tools-git')
depends=()
options=('staticlibs' '!strip')
conflicts=('google-breakpad-svn')

prepare() {
  mkdir "$srcdir/${pkgname}"
  cd "$srcdir/${pkgname}"
  /opt/depot_tools/fetch breakpad > /dev/null
}

pkgver() {
  cd "$srcdir/${pkgname}/src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}/src"

  msg2 "Configuring"
  ./configure --prefix=/usr
  msg2 "Building"
  make
}

package() {
  cd "$srcdir/${pkgname}/src"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
