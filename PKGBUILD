# Maintainer: ml <>
pkgname=kpt
pkgver=0.37.0
pkgrel=1
pkgdesc='Toolkit to manage, manipulate, customize, and apply Kubernetes Resource configurations'
arch=('x86_64')
url='https://googlecontainertools.github.io/kpt/'
license=('Apache')
depends=('git')
makedepends=('go')
optdepends=('asciinema: ttl command')
install=kpt.install
source=("https://github.com/GoogleContainerTools/kpt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1452b7b287749728f17040c27e5054a80ad40443725097516be5bf31c6d3bd60')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  go build -o "$pkgname" -ldflags=-linkmode=external
}

# tests require configures Git identities
# @TODO find safe way to set Git identities without violating $HOME privacy
#check() {
#  cd "${pkgname}-${pkgver}"
#  # ./internal only. we don't want e2e tests
#  go test -short ./internal/...
#}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
