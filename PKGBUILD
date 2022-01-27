# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
# Maintainer: Carlos Alexandro Becker <carlos at becker dot software>

pkgname='goreleaser-pro-bin'
pkgver=1.4.1
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('goreleaser' 'goreleaser-pro')
conflicts=('goreleaser' 'goreleaser-pro')

source_aarch64=('https://github.com/goreleaser/goreleaser-pro/releases/download/v1.4.1-pro/goreleaser-pro_Linux_arm64.tar.gz')
sha256sums_aarch64=('36f956ada18433fadff1bbee6829f1f1487bade0e161e0fa3dfd5e39e196fd5f')

source_armv7h=('https://github.com/goreleaser/goreleaser-pro/releases/download/v1.4.1-pro/goreleaser-pro_Linux_armv7.tar.gz')
sha256sums_armv7h=('4499fb2fb877e9e6f5d4837e218f8380e17e79c2ba2d7ba5c805d814a2a592f2')

source_i686=('https://github.com/goreleaser/goreleaser-pro/releases/download/v1.4.1-pro/goreleaser-pro_Linux_i386.tar.gz')
sha256sums_i686=('bdd6596d9118cf8f6b306d9ef98c45775f87803ddf890c848acc6df83bf2d3c3')

source_x86_64=('https://github.com/goreleaser/goreleaser-pro/releases/download/v1.4.1-pro/goreleaser-pro_Linux_x86_64.tar.gz')
sha256sums_x86_64=('05ddb23b8c6367d5b1f877f9b09d084faa5b38024352adf7d577f1c4e95930cc')

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
