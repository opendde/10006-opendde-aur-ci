# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
# Maintainer: Carlos Alexandro Becker <carlos at becker dot software>

pkgname='goreleaser-pro-bin'
pkgver=1.11.5
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('goreleaser' 'goreleaser-pro')
conflicts=('goreleaser' 'goreleaser-pro')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/goreleaser/goreleaser-pro/releases/download/v1.11.5-pro/goreleaser-pro_Linux_arm64.tar.gz")
sha256sums_aarch64=('ab8c9bbf5e7c46dc9eaa408c8887ab9614780ef92158102a06066670733de937')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/goreleaser/goreleaser-pro/releases/download/v1.11.5-pro/goreleaser-pro_Linux_armv7.tar.gz")
sha256sums_armv7h=('ebb4860aeb38c470d8fa411935927b095c0c85b8872399e63bc8cbe2a0bfc5eb')

source_i686=("${pkgname}_${pkgver}_i686.tar.gz::https://github.com/goreleaser/goreleaser-pro/releases/download/v1.11.5-pro/goreleaser-pro_Linux_i386.tar.gz")
sha256sums_i686=('ed6010b8e8559f2f696c5f462f990c8855a95a6924f852dde9708801a6e11666')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/goreleaser/goreleaser-pro/releases/download/v1.11.5-pro/goreleaser-pro_Linux_x86_64.tar.gz")
sha256sums_x86_64=('2982ef1e336fa220663e46913819737bbd8ea844751b60bc7019f7e18b74faea')

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
