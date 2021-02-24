# Maintainer: Hao Long <aur@esd.cc>

pkgname=gitjacker
pkgver=0.0.3
pkgrel=1
pkgdesc="Leak git repositories from misconfigured websites"
arch=("x86_64" "i686")
url="https://github.com/liamg/gitjacker"
license=("Unlicense")
depends=("git")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aa5489ceeca425b57edf045c49974a9d27b414da4fcab3bd26c9b5612973b7e5')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildmode=pie -trimpath -modcacherw -mod=vendor -o=gitjacker \
    -ldflags="-linkmode=external -X=github.com/liamg/gitjacker/internal/app/version.Version=v${pkgver}" \
    cmd/gitjacker/main.go
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 gitjacker ${pkgdir}/usr/bin/${pkgname}
}
