# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=shell2http-git
pkgver=1.13.r38.g4a8c022
pkgrel=1
pkgdesc="HTTP-server to execute shell commands"
arch=('x86_64')
url='https://github.com/msoap/shell2http'
license=('MIT')
depends=('glibc')
provides=('shell2http')
makedepends=('go-pie' 'git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/shell2http"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/shell2http"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "${srcdir}/shell2http"
  go build -v -o "${srcdir}/shell2http-bin"
  gzip --force shell2http.1
}

package() {
  cd "${srcdir}/shell2http"
  install -Dm755 "${srcdir}"/shell2http-bin "${pkgdir}/usr/bin/shell2http"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 shell2http.1.gz -t "${pkgdir}/usr/share/man/man1"
  go clean -modcache #Remove go libraries
}