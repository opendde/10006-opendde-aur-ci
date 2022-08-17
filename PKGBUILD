# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Randy Fay <randy at randyfay.com>

pkgname='ddev-bin'
pkgver=1.21.1
pkgrel=1
pkgdesc='DDEV-Local: a local web development environment'
url='https://github.com/drud/ddev'
arch=('aarch64' 'x86_64')
license=('Apache 2')
provides=('ddev')
conflicts=('ddev')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/drud/ddev/releases/download/v1.21.1/ddev_linux-arm64.v1.21.1.tar.gz")
sha256sums_aarch64=('692fa720a7d8cd9f7b6ae1f039e19576eafd6d01974994c13bcf5370dcfda4f7')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/drud/ddev/releases/download/v1.21.1/ddev_linux-amd64.v1.21.1.tar.gz")
sha256sums_x86_64=('296c224efc7ba7d991f3ccf3790fe819d0b883c6e8794065c88fd997ba526ea8')

package() {
  # bin
  install -Dm755 "./ddev" "${pkgdir}/usr/bin/ddev"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/ddev/LICENSE"

  # completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "./ddev_bash_completion.sh" "${pkgdir}/usr/share/bash-completion/completions/ddev"
  install -Dm644 "./ddev_zsh_completion.sh" "${pkgdir}/usr/share/zsh/site-functions/_ddev"
  install -Dm644 "./ddev_fish_completion.sh" "${pkgdir}/usr/share/fish/vendor_completions.d/ddev.fish"
}
