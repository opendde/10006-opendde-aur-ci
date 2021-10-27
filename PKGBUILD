# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sheldon
pkgver=0.6.5
pkgrel=1
pkgdesc="A fast and configurable shell plugin manager"
arch=('x86_64')
url="https://sheldon.cli.rs"
license=('Apache' 'MIT')
depends=('curl')
makedepends=('git' 'rust' 'mdbook-linkcheck')
_commit='dca03f43aa9f1188c98697a77c15a1e16cc3a2c3'
source=("git+https://github.com/rossmacarthur/sheldon.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  # binary
  cargo build --frozen --release --all-features

  # documentation
  mdbook build docs
}

check() {
  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/sheldon

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
