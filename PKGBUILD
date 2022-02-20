# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=wordle-tui-git
pkgver=0.4.0.r33.gca246cd
pkgrel=1
pkgdesc='TUI Wordle'
arch=('x86_64')
url='https://github.com/conradludgate/wordle'
license=('N.A.')
makedepends=('git' 'rust')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/wordle "$pkgdir/usr/bin/wordle"
}
