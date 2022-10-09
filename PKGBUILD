# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: matthias.lisin
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.42.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('083bc45aa08f3ad2080adddef8f4272b0a90e5f61f0f316eea35b69e227b4d43')

prepare() {
  cd "wtf-$pkgver"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x
}

build() {
  cd "wtf-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "wtf-$pkgver"
  install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r _sample_configs "$pkgdir/usr/share/doc/$pkgname/sample_configs/"
}
