# Maintainer: Your name <bros at brocode dot sh>

pkgname=fblog
pkgver=1.3.1
pkgrel=1
pkgdesc="command-line JSON Log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('WTFPL')
source=('https://github.com/brocode/fblog/releases/download/1.3.1/fblog')
sha256sums=('9c61c477a14d580ac66947d53d6fa0d752dc08d216663ca679cf04d8e0476cc3')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fblog
  cp fblog "${pkgdir}/usr/bin/fblog"
}

