# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=gron
pkgver=0.6.1
pkgrel=1
pkgdesc='Makes JSON greppable'
arch=('x86_64')
url="https://github.com/tomnomnom/gron"
license=('MIT')
makedepends=('go')
source=("https://github.com/tomnomnom/gron/archive/v$pkgver.tar.gz")
sha256sums=('eef150a425aa4eaa8b2e36a75ee400d4247525403f79e24ed32ccb346dc653ff')

check() {
  cd $pkgname-$pkgver
  go test .
}

build() {
  cd $pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 completions/gron.fish "$pkgdir"/usr/share/fish/vendor_completions.d/gron.fish
}
