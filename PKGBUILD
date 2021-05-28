# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

# This file is automatically generated. Do not edit.

pkgname=parallel-disk-usage-bin
pkgver=0.1.1
source=(pdu-fdd05e889af73d0ae15e74af0edb06642962a49a::https://github.com/KSXGitHub/parallel-disk-usage/releases/download/0.1.1/pdu-x86_64-unknown-linux-gnu completion.0.1.1.bash::https://github.com/KSXGitHub/parallel-disk-usage/releases/download/0.1.1/completion.bash completion.0.1.1.fish::https://github.com/KSXGitHub/parallel-disk-usage/releases/download/0.1.1/completion.fish completion.0.1.1.zsh::https://github.com/KSXGitHub/parallel-disk-usage/releases/download/0.1.1/completion.zsh https://raw.githubusercontent.com/KSXGitHub/parallel-disk-usage/0.1.1/README.md https://raw.githubusercontent.com/KSXGitHub/parallel-disk-usage/0.1.1/LICENSE)
_checksum=fdd05e889af73d0ae15e74af0edb06642962a49a
_completion_checksums=(SKIP SKIP SKIP)
# This PKGBUILD is not a full PKGBUILD
# pkgname, pkgver, source, and sha1sums are to be generated
pkgdesc='Create a filesystem tree from YAML'
pkgrel=1
arch=(x86_64)
license=(Apache-2.0)
url='https://github.com/KSXGitHub/parallel-disk-usage'
provides=(parallel-disk-usage)
conflicts=(parallel-disk-usage)
sha1sums=(
  "$_checksum"                  # for the pdu binary
  "${_completion_checksums[@]}" # for the completion files
  SKIP                          # for the readme file
  SKIP                          # for the license file
)

package() {
  install -Dm755 "pdu-$_checksum" "$pkgdir/usr/bin/pdu"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "completion.$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/pdu"
  install -Dm644 "completion.$pkgver.fish" "$pkgdir/usr/share/fish/completions/pdu.fish"
  install -Dm644 "completion.$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_pdu"
}

