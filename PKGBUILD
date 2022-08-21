# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('gopsuinfo')
pkgver=0.1.1
pkgrel=2
pkgdesc="A gopsutil-based command to display customizable system info, intended for nwg-panel or Tint2"
arch=('x86_64')
url="https://github.com/nwg-piotr/gopsuinfo"
license=('MIT')
provides=('gopsuinfo')
conflicts=('gopsuinfo' 'gopsuinfo-git' 'gopsuinfo-bin')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/gopsuinfo/archive/v"$pkgver".tar.gz")

md5sums=('aac58ce8d5294b1970643f9d2e2924d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -o bin/"$pkgname" *.go
}

package() {
  cd "$srcdir"
  install -D -t "$pkgdir"/usr/share/"$pkgname"/icons_light "$pkgname"-"$pkgver"/icons_light/*
  install -D -t "$pkgdir"/usr/share/"$pkgname"/icons_dark "$pkgname"-"$pkgver"/icons_dark/*
  install -Dm755 -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/bin/"$pkgname"
}
