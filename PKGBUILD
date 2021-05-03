# Maintainer: Hao Long <aur@esd.cc>

pkgname=platypus
pkgver=1.4.2
pkgrel=1
pkgdesc="A modern multiple reverse shell sessions manager written in go"
arch=("x86_64" "i686")
url="https://github.com/WangYihang/Platypus"
license=("LGPL3")
depends=("glibc")
makedepends=("go" "yarn" "go-bindata" "python" "nodejs-lts-erbium")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bf8f1dbaa1144c506316d80d230becf30130a2310c9ec363bcd896339d45d55f')

build() {
  cd Platypus-${pkgver}
  cd html/frontend && yarn && yarn build && cd ../../
  cd html/ttyd && yarn && yarn build && cd ../../
  go-bindata -pkg resource -o ./lib/util/resource/resource.go ./lib/runtime/... ./html/ttyd/dist/... ./html/frontend/build/...
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o platypus platypus.go
}

package() {
  cd Platypus-${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
