# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname='gitprompt-bin'
pkgver=0.8.2
pkgrel=1
pkgdesc='Informative git prompt for zsh and bash'
url='https://github.com/abhinav/gitprompt'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=('gitprompt')
conflicts=('gitprompt')

source_aarch64=('https://github.com/abhinav/gitprompt/releases/download/v0.8.2/gitprompt_0.8.2_Linux_arm64.tar.gz')
sha256sums_aarch64=('b21c8f3a81b3782400cf5b83b02f864fd13eb7d11e19a2b5cc6dd8779db54607')

source_armv6h=('https://github.com/abhinav/gitprompt/releases/download/v0.8.2/gitprompt_0.8.2_Linux_armv6.tar.gz')
sha256sums_armv6h=('23e6ca7abf5c9726d2b2a1c0bdf84bbb075f9e4c2640511c472cadda72af9035')

source_armv7h=('https://github.com/abhinav/gitprompt/releases/download/v0.8.2/gitprompt_0.8.2_Linux_armv7.tar.gz')
sha256sums_armv7h=('c8674e3c52c819f722b65e08f1fca54048e4f8df17fc55dbaa6e950f8c13f174')

source_i686=('https://github.com/abhinav/gitprompt/releases/download/v0.8.2/gitprompt_0.8.2_Linux_i386.tar.gz')
sha256sums_i686=('da32d6480f5655dc4dfb2e247641d21bf125b36d40f33e1c26ae9424d9ece451')

source_x86_64=('https://github.com/abhinav/gitprompt/releases/download/v0.8.2/gitprompt_0.8.2_Linux_x86_64.tar.gz')
sha256sums_x86_64=('a70aa0ebbed2bb3d34dd6ef0a0a0ee0434efe04e7e9450ae3d7a052c98856a19')

package() {
  install -Dm755 "./gitprompt" "${pkgdir}/usr/bin/gitprompt"
  install -Dm755 "./LICENSE" "${pkgdir}/usr/share/licenses/gitprompt/LICENSE"
}
