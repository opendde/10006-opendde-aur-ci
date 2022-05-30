# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname='tmux-fastcopy-bin'
pkgver=0.9.0
pkgrel=1
pkgdesc='easymotion-style text copying for tmux.'
url='https://github.com/abhinav/tmux-fastcopy'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('tmux-fastcopy')
conflicts=('tmux-fastcopy')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/abhinav/tmux-fastcopy/releases/download/v0.9.0/tmux-fastcopy_0.9.0_Linux_arm64.tar.gz")
sha256sums_aarch64=('d4261d77fc3a6901192b978bd06045fd57b3b35d98bc5f8e2d09ea82a23ec62e')

source_armv6h=("${pkgname}_${pkgver}_armv6h.tar.gz::https://github.com/abhinav/tmux-fastcopy/releases/download/v0.9.0/tmux-fastcopy_0.9.0_Linux_armv6.tar.gz")
sha256sums_armv6h=('4f533816a007f7b7c7668a9e3ce3f0ac8c612ada1011ac08a2ff850a2430150e')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/abhinav/tmux-fastcopy/releases/download/v0.9.0/tmux-fastcopy_0.9.0_Linux_armv7.tar.gz")
sha256sums_armv7h=('4f0853a18ffeae32a88c70faba560b58efd97c1bbe88e4c5a30f8ba7b135dc04')

source_i686=("${pkgname}_${pkgver}_i686.tar.gz::https://github.com/abhinav/tmux-fastcopy/releases/download/v0.9.0/tmux-fastcopy_0.9.0_Linux_i386.tar.gz")
sha256sums_i686=('e703dd025be232d92ecc8cf4ce4a23e1dff0093c286f7001d844565658ea5f21')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/abhinav/tmux-fastcopy/releases/download/v0.9.0/tmux-fastcopy_0.9.0_Linux_x86_64.tar.gz")
sha256sums_x86_64=('4b8dbd67dba937fe0c93e498c1ae0e76f70fae6bd786c139c689adc70f3cb4bd')

package() {
  install -Dm755 "./tmux-fastcopy" "${pkgdir}/usr/bin/tmux-fastcopy"
  install -Dm755 "./LICENSE" "${pkgdir}/usr/share/licenses/tmux-fastcopy/LICENSE"
}
