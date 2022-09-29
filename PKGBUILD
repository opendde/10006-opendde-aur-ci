# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: jonah <me@jon4hz.io>

pkgname='wishbox-bin'
pkgver=0.5.6
pkgrel=1
pkgdesc='wishlist using netbox as inventory source'
url='https://jon4hz.io'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('wishbox')
conflicts=('wishbox')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jon4hz/wishbox/releases/download/v0.5.6/wishbox-v0.5.6-linux-arm64.tar.gz")
sha256sums_aarch64=('423dd2e1c053435e00015846d52cf94df81922685f89bc63b19653be711f060c')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/jon4hz/wishbox/releases/download/v0.5.6/wishbox-v0.5.6-linux-armv7.tar.gz")
sha256sums_armv7h=('df99d7b27dcb5d305b0169f18dd77e178e201176ba0906f51189b0706e6fa978')

source_i686=("${pkgname}_${pkgver}_i686.tar.gz::https://github.com/jon4hz/wishbox/releases/download/v0.5.6/wishbox-v0.5.6-linux-386.tar.gz")
sha256sums_i686=('9071a46d89473eaa444f36780d00c3feaebd704dd8b75955fee6c5390982ddda')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jon4hz/wishbox/releases/download/v0.5.6/wishbox-v0.5.6-linux-amd64.tar.gz")
sha256sums_x86_64=('6e64fb9f6d0861a00649396e1fbcb0bd000e55db49261df824037fbbd4413d7d')

package() {
  # bin
  install -Dm755 "./wishbox" "${pkgdir}/usr/bin/wishbox"
  # license
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/wishbox/LICENSE"
  # completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "./completions/wishbox.bash" "${pkgdir}/usr/share/bash-completion/completions/wishbox"
  install -Dm644 "./completions/wishbox.zsh" "${pkgdir}/usr/share/zsh/site-functions/_wishbox"
  install -Dm644 "./completions/wishbox.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/wishbox.fish"
  # man pages
  install -Dm644 "./manpages/wishbox.1.gz" "${pkgdir}/usr/share/man/man1/wishbox.1.gz"
}
