# Maintainer: sum01 <sum01@protonmail.com>
pkgname=rust-clippy
pkgver=0.0.168
pkgrel=1
pkgdesc="A bunch of lints to catch common mistakes and improve your Rust code"
arch=('i686' 'x86_64')
url="https://github.com/rust-lang-nursery/rust-clippy"
license=('MPL2')
depends=('rust-nightly')
makedepends=('cargo-nightly' 'rustup')
build() {
 rustup run nightly cargo install clippy --root "$srcdir/build" --vers $pkgver --force 
}
package() {
  mv "$srcdir/build" "$pkgdir/usr"
  rm -f "$pkgdir/usr/.crates.toml"
}
