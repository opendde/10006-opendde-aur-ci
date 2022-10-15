# Maintainer: Lev Gorodetskiy <aur@drsr.io>
pkgname=unflac
pkgrel=1
pkgver=1.0
pkgdesc='A command line tool for fast frame accurate audio image + cue sheet splitting.'
arch=('x86_64')
url="https://git.sr.ht/~ft/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/$pkgver.tar.gz")
depends=('ffmpeg')
sha256sums=('a09c54d04127707c3f556836590de5d2ae6a78bf17a99472b602ef983f89b7b4')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}