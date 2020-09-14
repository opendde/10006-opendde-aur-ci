# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-server-git
pkgdesc="Core backend infrastructure of the PassWall platform (git)"
pkgver=1.1.2.r8.ga5bd93b
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-server"
license=('AGPL3')
makedepends=('git' 'go')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}/cmd/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}/cmd/${pkgname%-git}"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "$srcdir/${pkgname%-git}/cmd/${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" "$pkgdir/usr/local/bin/${pkgname%-git}"
  install -Dm 644 "../../README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
