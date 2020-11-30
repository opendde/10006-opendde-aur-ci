# Maintainer: a821
# Contributor: Matthias Loibl <mail at matthiasloibl dot com>
# Contributor: Morten Linderud <foxboron archlinux.org>

pkgname=gopass-git
pkgver=1.10.1.r32.g93539afc
pkgrel=2
pkgdesc="The slightly more awesome standard unix password manager for teams."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/gopasspw/gopass"
license=('MIT')
makedepends=('go' 'git')
optdepends=('xdotool: for typing passwords selected by dmenu'
            'xsel: clipboard support'
            'xclip: clipboard support')
provides=("gopass")
conflicts=("gopass")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd gopass
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd gopass
  sed -i 's|-gcflags="-trimpath=$(GOPATH)" -asmflags="-trimpath=$(GOPATH)"||' Makefile
}

build() {
  cd gopass
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make
}

package() {
  cd gopass
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
