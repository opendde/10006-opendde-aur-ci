# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-dev
pkgver=1.17rc1
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go perl)
provides=(go go-pie)
conflicts=(go go-pie)
options=(!strip staticlibs)
source=(https://storage.googleapis.com/golang/go$pkgver.src.tar.gz{,.asc})
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
sha256sums=('0d63be0f3abc79d35efcb60dfce4445e64bb1ea194edcfd9783a76316b7e85e2'
            'SKIP')

build() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  export GOPATH="$srcdir/"
  export GOROOT="$srcdir/${pkgname%-dev}"
  export GOBIN="$GOROOT/bin"

  cd "${pkgname%-dev}/src"
  ./make.bash --no-clean -v

  PATH="$GOBIN:$PATH" go install -v -race std
  PATH="$GOBIN:$PATH" go install -v -buildmode=shared std
}

check() {
  export GOARCH=amd64
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go
  export GOROOT="$srcdir/${pkgname%-dev}"
  export GOBIN="$GOROOT/bin"
  export PATH="$srcdir/${pkgname%-dev}/bin:$PATH"
  export GO_TEST_TIMEOUT_SCALE=2

  cd "${pkgname%-dev}/src"
  # rm os/signal/signal_cgo_test.go  # TODO: There is a bug somewhere.
  #                                  # Should only affect containers
  #                                  # so lets just say No.
  ./run.bash --no-rebuild -v -v -v -k
}

package() {
  cd "${pkgname%-dev}"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" "$pkgdir/usr/share/doc/go"
  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go"
  cp -r doc/* "$pkgdir/usr/share/doc/go"

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap" "$pkgdir/usr/lib/go/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go/pkg/obj/go-build/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-dev}/LICENSE"
}

# vim: ts=2 sw=2 et
