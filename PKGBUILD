# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Purple Clay <purple clay at gmail dot com>

pkgname='misspell-codeclimate-bin'
pkgver=0.1.0
pkgrel=1
pkgdesc='Turn that misspell report into a GitLab compatible codeclimate report'
url='https://github.com/purpleclay/misspell-codeclimate'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('misspell-codeclimate')
conflicts=('misspell-codeclimate')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/purpleclay/misspell-codeclimate/releases/download/v0.1.0/misspell-codeclimate_0.1.0_linux-arm64.tar.gz")
sha256sums_aarch64=('4efa9aef34fd8bf8b40d680a0f114e9c8d0248570ae9aa0a35f2f7c6d6859cd8')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/purpleclay/misspell-codeclimate/releases/download/v0.1.0/misspell-codeclimate_0.1.0_linux-arm.tar.gz")
sha256sums_armv7h=('3e8e5535f2af934b05409779495f61d3eda843dc85cc23331cf3e102a64fe55e')

source_i686=("${pkgname}_${pkgver}_i686.tar.gz::https://github.com/purpleclay/misspell-codeclimate/releases/download/v0.1.0/misspell-codeclimate_0.1.0_linux-i386.tar.gz")
sha256sums_i686=('52e187eed1ccd41b5bc7e258a984557ef55c2a88a86cb54c5ce4afaa9b4ff112')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/purpleclay/misspell-codeclimate/releases/download/v0.1.0/misspell-codeclimate_0.1.0_linux-x86_64.tar.gz")
sha256sums_x86_64=('285382a1d07bcd077a01e0f217c96033236a9adccd843d8049409d97f75d5da3')

package() {
  # bin
  install -Dm755 "./misspell-codeclimate" "${pkgdir}/usr/bin/misspell-codeclimate"

  # license
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/misspell-codeclimate/LICENSE"

  # completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "./completions/misspell-codeclimate.bash" "${pkgdir}/usr/share/bash-completion/completions/misspell-codeclimate"
  install -Dm644 "./completions/misspell-codeclimate.zsh" "${pkgdir}/usr/share/zsh/site-functions/_misspell-codeclimate"
  install -Dm644 "./completions/misspell-codeclimate.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/misspell-codeclimate.fish"

  # manpages
  install -Dm644 "./manpages/misspell-codeclimate.1.gz" "${pkgdir}/usr/share/man/man1/misspell-codeclimate.1.gz"
}
