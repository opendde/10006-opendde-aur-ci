# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=scaleway-cli
pkgver=1.16
pkgrel=1
pkgdesc="Manage BareMetal Servers from Command Line"
arch=('i686' 'x86_64')
url="https://scaleway.com"
license=('MIT')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('bda49f5b33a3214aabbb69a51284fc6ca73110cacecbd8ff3edc0749a44cbced')

prepare() {
  # setup local gopath
  mkdir -p "$srcdir/src/github.com/scaleway/"
  ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/src/github.com/scaleway/$pkgname"

  cd "$srcdir/src/github.com/scaleway/$pkgname"

  GOPATH="$srcdir" go get -v -d
}

check() {
  cd "$srcdir/src/github.com/scaleway/$pkgname"
  GOPATH="$srcdir" \
    go test -ldflags \
    "-X github.com/scaleway/scaleway-cli/pkg/scwversion.GITCOMMIT=nogit" \
    -i .//cmd/scw
}

build() {
  cd "$srcdir/src/github.com/scaleway/$pkgname"
  GOPATH="$srcdir" \
    go build -ldflags \
    "-X github.com/scaleway/scaleway-cli/pkg/scwversion.GITCOMMIT=nogit" \
    -o scw .//cmd/scw
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 scw "$pkgdir/usr/bin/scw"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
