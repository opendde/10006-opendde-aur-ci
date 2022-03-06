# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
# Maintainer: Carlos Alexandro Becker <carlos at becker dot software>

pkgname='goreleaser-bin'
pkgver=1.6.1
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('goreleaser')
conflicts=('goreleaser')

source_aarch64=('https://github.com/goreleaser/goreleaser/releases/download/v1.6.1/goreleaser_Linux_arm64.tar.gz')
sha256sums_aarch64=('7de6659940530b019239a1c161d91cca198849a0fb4578c6247c69c322f8ef78')

source_armv7h=('https://github.com/goreleaser/goreleaser/releases/download/v1.6.1/goreleaser_Linux_armv7.tar.gz')
sha256sums_armv7h=('1b42ef17251c8ec8eea1603817250fe6ef7a980ae45077f67363dc246a6bfcb3')

source_i686=('https://github.com/goreleaser/goreleaser/releases/download/v1.6.1/goreleaser_Linux_i386.tar.gz')
sha256sums_i686=('61da54e694beea30ddb291d9b80703dfaf370ceecea368cc7bef8a38a0fab70b')

source_x86_64=('https://github.com/goreleaser/goreleaser/releases/download/v1.6.1/goreleaser_Linux_x86_64.tar.gz')
sha256sums_x86_64=('46758083ed5afbf1a918df5abd82d740684e4d7d36364f9a1e09a4c4badab985')

package() {
  # bin
  install -Dm755 "./goreleaser" "${pkgdir}/usr/bin/goreleaser"

  # license
  install -Dm644 "./LICENSE.md" "${pkgdir}/usr/share/licenses/goreleaser/LICENSE"

  # completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "./completions/goreleaser.bash" "${pkgdir}/usr/share/bash-completion/completions/goreleaser"
  install -Dm644 "./completions/goreleaser.zsh" "${pkgdir}/usr/share/zsh/site-functions/_goreleaser"
  install -Dm644 "./completions/goreleaser.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/goreleaser.fish"

  # man pages
  install -Dm644 "./manpages/goreleaser.1.gz" "${pkgdir}/usr/share/man/man1/goreleaser.1.gz"
}
