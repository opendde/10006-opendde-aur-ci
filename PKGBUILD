# Maintainer: krion <krionux@gmail.com>
pkgname=goploader-client-git
pkgver=0.1
pkgrel=1
pkgdesc="Simple client-server application to upload files/text"
arch=()
url="https://github.com/Depado/goploader"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('goploader')
validpgpkeys=()

prepare() {
  mkdir "$srcdir/go"
  export GOPATH="$srcdir/go"
}

build() {
  cd $GOPATH
  go get github.com/Depado/goploader/client
}

package() {
  cd $GOPATH
  install -Dm755 "$srcdir/go/bin/client" "$pkgdir/usr/bin/goploader"
}
