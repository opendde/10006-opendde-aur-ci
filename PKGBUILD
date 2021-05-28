# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

# This file is automatically generated. Do not edit.

pkgname=parallel-disk-usage
pkgver=0.1.2
source=(parallel-disk-usage-0.1.2.tar.gz::https://github.com/KSXGitHub/parallel-disk-usage/archive/0.1.2.tar.gz)
sha1sums=(SKIP)
# This PKGBUILD is not a full PKGBUILD
# pkgname, pkgver, source, and sha1sums are to be generated
pkgdesc='Create a filesystem tree from YAML'
pkgrel=1
arch=(x86_64)
license=(Apache-2.0)
url='https://github.com/KSXGitHub/parallel-disk-usage'
makedepends=(cargo)

build() {
  cd "$srcdir/parallel-disk-usage-$pkgver"
  cargo build --release --locked --bin pdu
}

package() {
  cd "$srcdir/parallel-disk-usage-$pkgver"
  install -Dm755 target/release/pdu "$pkgdir/usr/bin/pdu"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 exports/completion.bash "$pkgdir/usr/share/bash-completion/completions/pdu"
  install -Dm644 exports/completion.fish "$pkgdir/usr/share/fish/completions/pdu.fish"
  install -Dm644 exports/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_pdu"
}

