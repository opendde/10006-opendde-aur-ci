# Maintainer: Todd E Johnson <todd@toddejohnson.net>
pkgname=rdio-scanner
pkgver=6.6.1
pkgrel=1
pkgdesc='Ingest and distribute audio generated by various software-defined radio recorders'
arch=('x86_64')
url="https://github.com/chuot/rdio-scanner"
license=('GPL3')
makedepends=('go' 'npm' 'nodejs-lts-gallium' 'pandoc' 'texlive-bin' 'texlive-core' 'zip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
  'rdio-scanner.service'
  'rdio-scanner.sysusers'
  'rdio-scanner.tmpfiles')
sha256sums=('9d923d5259c4674c13ff5fcfd703856750815d99b214d7ee68bf99a87b9e4146'
  'c7823f308853a524191cbbeca921534ab43e350632a643b4144907346205b8fc'
  '897ff33dff84bf4c90a7c241d67191f1f35d5d36321ae4841bc21ab650af3657'
  '6477e4909a99f81d01c3b9493b52ec8a2c2ad146c43fe1cbbb9a1b4091a88a5c')

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
  make webapp
  pandoc -f markdown -o build/rdio-scanner.pdf --resource-path docs:docs/platforms docs/platforms/freebsd.md docs/webapp.md CHANGELOG.md
  cd server
  go build -o ../build
}

check() {
  cd "$pkgname-$pkgver"
  cd "server"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/server "$pkgdir"/usr/bin/$pkgname
  install -Dm644 build/$pkgname.pdf "$pkgdir"/usr/share/doc/$pkgname/$pkgname.pdf
  install -D -m644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -D -m644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}


