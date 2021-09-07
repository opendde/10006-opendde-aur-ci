# vim: expandtab shiftwidth=2 tabstop=2 softtabstop=4
# Maintainer: Peter Cai <peter@typeblog.net>

pkgname=juicefs-oss
_pkgname=juicefs
pkgver=0.16.2
pkgrel=3
pkgdesc="A distributed POSIX file system built on top of Redis and S3. (FOSS version)"
arch=('x86_64')
url="https://github.com/juicedata/juicefs"
license=('AGPL3')
conflicts=('juicefs')
depends=('glibc')
makedepends=('go')
source=("juicefs-$pkgver.tar.gz::https://github.com/juicedata/juicefs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb09345ef67adaee55333ca45e911376cc8ced7f700f3abe8290c74e4d9d7943')

prepare() {
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/cmd "$pkgdir"/usr/bin/$_pkgname
  ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
