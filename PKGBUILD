# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=2.0
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=('steam')
makedepends=('rust' 'gcc')
conflicts=(proton-caller-git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('745ceaf5ffbab5cf3b7675b6381cbcf54f08e2184ddf7a128e5aa31c05729beb')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo build --release --locked
}

check() {
  cd "$srcdir/$__pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable} cargo test --release --locked
}

package() {
  cd "$srcdir/$__pkgname-$pkgver"
  install -Dm755 target/release/proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 manual/proton-call.6 "$pkgdir"/usr/share/man/man6/proton-call.6
}
