# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-look')
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK3 settings editor adapted to work in the sway/wlroots environment"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-look"
license=('MIT')
provides=('nwg-look')
conflicts=('nwg-look-git' 'nwg-look-bin')
makedepends=('go')
depends=('gtk3' 'xcur2png')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-look/archive/v"$pkgver".tar.gz")

md5sums=('70201e67d4512a231b7ef0e8737281e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -o "$pkgname" *.go
}

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/"$pkgname"
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/stuff/main.glade
  install -Dm644 -t "$pkgdir"/usr/share/applications "$pkgname"-"$pkgver"/stuff/nwg-look.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps "$pkgname"-"$pkgver"/stuff/nwg-look.svg
  install -Dm755 -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/"$pkgname"
}
