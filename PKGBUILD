# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Thomas Eizinger <thomas@eizinger.io>

# All Thomas PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=dylint
pkgname=cargo-dylint
pkgver=2.0.9
pkgrel=0
pkgdesc="A tool for running Rust lints from dynamic libraries"
arch=('x86_64')
url="https://github.com/trailofbits/${_gitname}"
license=('MIT')
makedepends=('rust')
source=("https://github.com/trailofbits/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b1dd78270c1983545150ce1229a13f8404ed12d0f643e5f883ff50e692824d9')

build() {
  cd "$srcdir/${_gitname}-${pkgver}"

  cargo build --package ${pkgname} --release --target-dir=./target
}

package() {
  install -Dm755 "$srcdir/${_gitname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
