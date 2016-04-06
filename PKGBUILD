# $Id$
# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

_pkgname="joe"
pkgname="joe-go"
pkgver="1.0.1"
pkgrel=1
pkgdesc="A .gitignore magician in your command line"
arch=('any')
url="http://github.com/karan/joe/"
license=('MIT')
depends=()
provides=('joe')
makedepends=('go')
conflicts=('python2-joe')
install=joe.install
source=("https://github.com/karan/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6a26e8f40ae1022c4bceaae9e8b21844')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  GOPATH=${srcdir}/${_pkgname}-${pkgver} go get github.com/codegangsta/cli
  GOPATH=${srcdir}/${_pkgname}-${pkgver} go get github.com/termie/go-shutil
  GOPATH=${srcdir}/${_pkgname}-${pkgver} go build -o build/joe joe.go utils.go
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/${_pkgname}-${pkgver}/build/joe ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
