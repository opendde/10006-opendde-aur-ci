# Maintainer: Daniel Xu <dxu@dxuuu.xyz>
pkgname=below-git
_pkgname=below
pkgver=v0.2.0.r35.g584fdef
pkgrel=1
pkgdesc="An interactive resource monitor for modern Linux systems"
arch=('x86_64')
url="https://github.com/facebookincubator/below/"
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('cargo' 'git' 'libbpf' 'clang')
depends=('zlib' 'libelf' 'ncurses')
source=("$pkgname::git+https://github.com/facebookincubator/below.git")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  RUSTUP_TOOLCHAIN=stable cargo build --release --target-dir=target
}

pkgver() {
  cd "$pkgname"
  git describe --long --tag | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
