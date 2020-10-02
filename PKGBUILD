# PKGBUILD created by using cargo-aur
pkgname='yas-tui-git'
pkgver=0.1.1
pkgrel=1
pkgdesc='A sudo replacement, written in rust, with a tui'
arch=('any')
url='https://github.com/alx365/yas'
license=('MIT')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('yas-tui-git::git+https://github.com/alx365/yas')
conflicts=('yas-git')

pkgver() {
 cd "$pkgname"
 echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
  cd "$pkgname"
  cargo build --release --features "tui" --locked --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --features "tui" --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 4755 target/release/yas -t "${pkgdir}/usr/bin"
  #chmod 4755 "$pkgdir"/usr/bin/yas
  install -Dm 755 ../$pkgname/LICENSE "${pkgdir}/usr/share/licenses/yas"
}

