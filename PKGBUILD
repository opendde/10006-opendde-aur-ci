# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
pkgver=0.3.1
pkgrel=1
pkgdesc='A simple image hosting service'
arch=('x86_64')
url='https://git.asonix.dog/asonix/pict-rs'
license=('AGPL3')
depends=(
  'gcc-libs'
  'imagemagick'
  'ffmpeg'
  'perl-image-exiftool'
)
makedepends=('git' 'rust')
options=('!lto')
_commit='b972e5558712c3d9b55ba9cc1bf492ac3c5633b6'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
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

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md ./*.toml
  cp -vr client-examples "$pkgdir/usr/share/doc/$pkgname"
}
