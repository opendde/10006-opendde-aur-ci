# Maintainer: Mario Oenning <mo-son at mailbox dot org>

pkgname=pacseek
pkgver=1.4.8
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages'
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/$pkgname"
license=('GPL2')
depends=('pacman')
makedepends=('go')
optdepends=('xdg-utils: open URL on click support'
            'curl: show PKGBUILD support'
            'less: show PKGBUILD support')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('487ed096bc2ff6682a4dc4d575f5cd705b02e07eeed9ff9a99aca19227f6386c')

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

package() {
  cd "$pkgname-$pkgver"

  # bin
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # .desktop
  install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$pkgname.desktop"
  
  # icon
  install -Dm644 "assets/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
