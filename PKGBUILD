# Maintainer: Lars Francke <lars.francke@stackable.tech>

_commit=5d108d58579eb5ef12edf763d18aec0d45775fe6
pkgname=stackablectl
pkgver=0.6.0
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
makedepends=('go' 'rust')
source=("$pkgname::git+https://github.com/stackabletech/stackablectl.git#commit=$_commit")
b2sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/stackablectl
}
