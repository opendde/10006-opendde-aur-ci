# Maintainer: ml <>
pkgname=svu
pkgver=1.7.0
pkgrel=1
pkgdesc='Semantic Version Util'
arch=('x86_64')
url='https://github.com/caarlos0/svu'
license=('MIT')
depends=('git')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5e23e851651146921ad0855615e587ec58d324054f3aae4991ed709f12fa59c1')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o "$pkgname" -ldflags "-linkmode=external -X main.version=v$pkgver"
}

check() {
  cd "$pkgname-$pkgver"
  go test -v -short ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
