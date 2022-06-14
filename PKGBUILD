# Maintainer: Leander Oudakker <arch at leanderoudakker dot com>
pkgname=spectre-cli-git
pkgver=3.0.ios.alpha.2.r16.a5e7aab
pkgrel=1
pkgdesc="Spectre introduces a completely new way of thinking about passwords."
arch=('any')
url="https://gitlab.com/spectre.app/cli"
license=('GPL3')
depends=( 'ncurses' 'json-c' 'libsodium')
makedepends=('git')
provides=('spectre')
conflicts=('spectre')
source=("${pkgname}::git+https://gitlab.com/spectre.app/cli"
        "api::git+https://gitlab.com/spectre.app/api")
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname}"

  git submodule init
  git config submodule.api.url "$srcdir/api"
  git submodule update
}

build() {
  cd "$srcdir/${pkgname}"

  targets='spectre spectre-tests' ./build
}

check() {
  cd "$srcdir/${pkgname}"

  ./spectre-cli-tests
  ./spectre-tests
}

package() {
  cd "$srcdir/${pkgname}"

  install -Dm555 spectre "${pkgdir}/usr/bin/spectre"
}
