# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Johannes Bruederl <johannes.bruederl@gmail.com>
# Contributor: Michał Lisowski <lisu@riseup.net>

pkgname='kaf-bin'
pkgver=0.1.51
pkgrel=1
pkgdesc='Kafka CLI inspired by kubectl & docker'
url=''
arch=('aarch64')
license=('MIT')
provides=('kaf-bin')
conflicts=('kaf-bin')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/birdayz/kaf/releases/download/v0.1.51/kaf_0.1.51_Linux_arm64.tar.gz")
sha256sums_aarch64=('a28040007decfe197d993fdc04a7fab2b3e162719cc2b9715cf42181e1fd4aea')

package() {
  # bin
  install -Dm755 "./kaf" "${pkgdir}/usr/bin/kaf"

  # license
  install -Dm644 "./LICENSE.md" "${pkgdir}/usr/share/licenses/kaf/LICENSE"

  # completions
  # bash
  mkdir -p "${pkgdir}/etc/bash_completion.d"
  ./kaf completion bash > "${pkgdir}/etc/bash_completion.d/kaf"

  # zsh
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  ./kaf completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_kaf"

  # Fish
  ./kaf completion fish > ${pkgdir}/usr/share/fish/vendor_completions.d/kaf.fish
}
