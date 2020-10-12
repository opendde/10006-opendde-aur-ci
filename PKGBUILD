# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bit
pkgver=0.5.10
pkgrel=1
pkgdesc='A modern Git CLI'
arch=('x86_64')
url="https://github.com/chriswalz/bit"
license=('Apache')
makedepends=('go')
depends=('glibc')
conflicts=('bit-git')
provides=('bit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
install=bit.install
sha1sums=('6f2c2234ac98bf2479de62a6bffc528822292813')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "$pkgname-$pkgver"
  # Buildflags according to https://wiki.archlinux.org/index.php/Go_package_guidelines#Flags_and_build_options
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -o build -trimpath -buildmode=pie -ldflags "-extldflags \"${LDFLAGS}\" -s -w" -modcacherw
  cd "bitcomplete"
  go build -o bitcomplete -trimpath -buildmode=pie -ldflags "-extldflags \"${LDFLAGS}\" -s -w" -modcacherw
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 bitcomplete/bitcomplete "$pkgdir"/usr/bin/bitcomplete
}
