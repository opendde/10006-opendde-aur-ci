# Maintainer: Sam Therapy <sam at samtherapy dot net>
pkgname=awl-dns-git
pkgver=0.5.2.r32.g2d94ea6
pkgrel=1
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="A DNS client"
url="https://git.froth.zone/sam/awl"
license=('BSD')
makedepends=(
 'git'
 'go>=1.18'
 'scdoc'
)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}::git+https://git.froth.zone/sam/awl.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -ldflags=-X=main.version=${pkgver} -ldflags=-s -ldflags=-w -mod=readonly -modcacherw"
  export CGO_ENABLED=1

  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
