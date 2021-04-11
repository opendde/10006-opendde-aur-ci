# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

# This file is automatically generated. Do not edit.

pkgname=build-fs-tree
pkgver=0.1.2
source=(build-fs-tree-0.1.2.tar.gz::https://github.com/KSXGitHub/build-fs-tree/archive/0.1.2.tar.gz)
sha1sums=(SKIP)
# This PKGBUILD is not a full PKGBUILD
# pkgname, pkgver, source, and sha1sums are to be generated
pkgdesc='Create a filesystem tree from YAML'
pkgrel=1
arch=(x86_64)
license=(MIT)
url='https://github.com/KSXGitHub/build-fs-tree'
makedepends=(cargo)

build() {
  cd "$srcdir/build-fs-tree-$pkgver"
  cargo build --release --locked --bin build-fs-tree
}

package() {
  cd "$srcdir/build-fs-tree-$pkgver"
  install -Dm755 target/release/build-fs-tree "$pkgdir/usr/bin/build-fs-tree"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 exports/completion.bash "$pkgdir/usr/share/bash-completion/completions/build-fs-tree"
  install -Dm644 exports/completion.fish "$pkgdir/usr/share/fish/completions/build-fs-tree.fish"
  install -Dm644 exports/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_build-fs-tree"
}

