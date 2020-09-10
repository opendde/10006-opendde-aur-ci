# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

# This file is automatically generated. Do not edit.

pkgname=pretty-exec-bin
pkgver=0.0.21
source=(pretty-exec-636d9ccccdce4d0ea502ce4dcec31ee3b4d5ec98::https://github.com/KSXGitHub/pretty-exec/releases/download/0.0.21/pretty-exec-x86_64-unknown-linux-gnu completion.0.0.21.bash::https://github.com/KSXGitHub/pretty-exec/releases/download/0.0.21/completion.bash completion.0.0.21.fish::https://github.com/KSXGitHub/pretty-exec/releases/download/0.0.21/completion.fish completion.0.0.21.zsh::https://github.com/KSXGitHub/pretty-exec/releases/download/0.0.21/completion.zsh https://raw.githubusercontent.com/KSXGitHub/pretty-exec/master/LICENSE.md)
_checksum=636d9ccccdce4d0ea502ce4dcec31ee3b4d5ec98
_completion_checksums=(SKIP SKIP SKIP)
# This PKGBUILD is not a full PKGBUILD
# pkgname, pkgver, source, and sha1sums are to be generated
pkgdesc='Print command and execute it'
pkgrel=0
arch=(x86_64)
license=(MIT)
url='https://github.com/KSXGitHub/pretty-exec'
conflicts=(pretty-exec)
sha1sums=(
  "$_checksum"                  # for the pretty-exec binary
  "${_completion_checksums[@]}" # for the completion files
  SKIP                          # for the license file
)

package() {
  install -Dm755 "pretty-exec-$_checksum" "$pkgdir/usr/bin/pretty-exec"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/$pkgname/LICENSE.md"
  install -Dm644 "completion.$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/pretty-exec"
  install -Dm644 "completion.$pkgver.fish" "$pkgdir/usr/share/fish/completions/pretty-exec.fish"
  install -Dm644 "completion.$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_pretty-exec"
}

