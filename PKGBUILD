# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname='devc-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool to manage your devcontainers.'
url='https://github.con/nikaro/devc'
arch=('aarch64' 'x86_64')
license=('GPLv3')
provides=('devc')
conflicts=('devc')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/nikaro/devc/releases/download/v1.0.0-beta.5/devc_1.0.0-beta.5_linux_arm64.tar.gz")
sha256sums_aarch64=('b45de1d717a44fb34f983c55b1895b42894c5606a5826f875a4bdeafb73fcceb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/nikaro/devc/releases/download/v1.0.0-beta.5/devc_1.0.0-beta.5_linux_amd64.tar.gz")
sha256sums_x86_64=('3c11edc3e1568055ea82af606a6ac321525ac99571a31dcea5f0b818cfed268d')

package() {
  install -Dm755 "./devc" "${pkgdir}/usr/bin/devc"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/devc/LICENSE"
  install -Dm644 "./man/devc*.1" "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "./completions/devc" "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 "./completions/devc.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "./completions/_devc" "${pkgdir}/usr/share/zsh/site-functions/"
}
